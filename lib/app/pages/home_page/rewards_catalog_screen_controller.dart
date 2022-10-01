import 'package:flutter_steps_tracker/app/utils/dialogs.dart';
import 'package:flutter_steps_tracker/services/api_service/api_service.dart';
import 'package:flutter_steps_tracker/services/api_service/models/reward.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class RewardsCatalogScreenController extends GetxController {
  final ApiService _apiService = Get.find();
  final AuthService _authService = Get.find();

  final rewards = <Reward>[].obs;

  final _totalPoints = 0.obs;

  @override
  void onInit() {
    rewards.bindStream(_apiService.rewardsStream());
    _totalPoints.bindStream(
      _apiService.userTotalPoints(_authService.authFireStoreRef.id),
    );
    super.onInit();
  }

  void redeem(Reward reward) async {
    if (reward.price > _totalPoints.value) {
      Dialogs.pushInformationDialog(
        "you don't have enough points .. walk more !",
        "Sorry",
        () {},
      );
      return;
    }
    Dialogs.pushAreUSureDialog(
      "Are You sure ?",
      "u will lose ur points and they will never back ",
      () {
        _apiService.redeemARewardForUser(
          _authService.authFireStoreRef.id,
          reward,
        );
      },
    );
  }
}
