import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/services/api_service/models/point_exchange.dart';
import 'package:flutter_steps_tracker/services/api_service/models/redeem.dart';
import 'package:flutter_steps_tracker/services/api_service/models/reward.dart';
import 'package:get/get.dart';
import 'package:rxdart/streams.dart';

abstract class ApiService {
  Stream<int> userTotalStepsStream(String userId);
  Stream<int> userTotalPoints(String userId);

  Stream<List<Reward>> rewardsStream();
  Stream<List<PointExchange>> userPointExchangesStream(String userId);
  Stream<List<Redeem>> userRedeemsStream(String userId);

  Future<void> updateUserTotalSteps(String userId, int newStepsCount);
  Future<void> redeemARewardForUser(String userId, Reward reward);
  Future<void> exchangeStepsForPoints(String userId, int steps, int points);
}

class FirebaseApiService extends GetxService implements ApiService {
  final _fireStore = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> getUserDocument(String userId) {
    return _fireStore.collection("users").doc(userId);
  }

  @override
  Stream<List<Reward>> rewardsStream() {
    return _fireStore.collection("rewards").snapshots().map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              final ret = Reward.fromJson(doc.data());
              ret.id = doc.id;
              return ret;
            },
          ).toList(),
        );
  }

  @override
  Future<void> updateUserTotalSteps(String userId, int newStepsCount) async {
    await getUserDocument(userId).update({"totalSteps": newStepsCount});
  }

  @override
  Stream<int> userTotalStepsStream(String userId) {
    return getUserDocument(userId)
        .snapshots()
        .map((snapshot) => snapshot["totalSteps"]);
  }

  @override
  Stream<List<PointExchange>> userPointExchangesStream(String userId) {
    return getUserDocument(userId).collection("pointsHistory").snapshots().map(
      (snapshot) {
        final docs = snapshot.docs;
        final mapped =
            docs.map((raw) => PointExchange.fromJson(raw.data())..id = raw.id);
        return mapped.toList();
      },
    );
  }

  @override
  Stream<List<Redeem>> userRedeemsStream(String userId) {
    return getUserDocument(userId)
        .collection("redeems")
        .snapshots()
        .asyncMap((snapshot) async {
      final rawRedeemsList = snapshot.docs;
      final mapped = rawRedeemsList.map((doc) async {
        final reward = await doc['reward'].get();
        final redeem = Redeem(
          id: doc.id,
          reward: Reward.fromJson(reward.data()),
          time: DateTime.fromMillisecondsSinceEpoch(
            (doc['time'] as Timestamp).millisecondsSinceEpoch,
          ),
        );
        return redeem;
      }).toList();
      final res = await Future.wait(mapped);
      return res;
    });
  }

  @override
  Stream<int> userTotalPoints(String userId) {
    final combined =
        CombineLatestStream.combine2<List<Redeem>, List<PointExchange>, int>(
            userRedeemsStream(userId), userPointExchangesStream(userId), (
      redeemsList,
      pointsList,
    ) {
      final payed = redeemsList.fold<int>(
        0,
        (previousValue, element) => previousValue + element.reward.price,
      );
      final gained = pointsList.fold<int>(
        0,
        (previousValue, element) => previousValue + element.gainedPoints,
      );

      return gained - payed;
    });

    return combined;
  }

  @override
  Future<void> redeemARewardForUser(String userId, Reward reward) async {
    final ref = _fireStore.collection("rewards").doc(reward.id);
    await getUserDocument(userId).collection("redeems").add({
      "time": Timestamp.fromDate(DateTime.now()),
      "reward": ref,
    });
  }

  @override
  Future<void> exchangeStepsForPoints(
      String userId, int steps, int points) async {
    await getUserDocument(userId).collection("pointsHistory").add({
      "date": Timestamp.fromDate(DateTime.now()),
      "gainedPoints": points,
      "stepsCount": steps,
    });
  }
}
