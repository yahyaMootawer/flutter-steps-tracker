import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/services/api_service/models/reward.dart';

class Redeem {
  Redeem({
    required this.id,
    required this.reward,
    required this.time,
  });
  late final String id;
  late final Reward reward;
  late final DateTime time;

  Redeem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reward = Reward.fromJson(json['reward']);
    time = DateTime.fromMillisecondsSinceEpoch(
      (json['time'] as Timestamp).millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reward'] = reward.toJson();
    _data['time'] = time.toUtc();
    return _data;
  }
}
