import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/data_sources/pedometer_source.dart';
import 'package:flutter_steps_tracker/services/api_service/api_service.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final PedometerSource _pedometerSource = Get.find();
  final ApiService _apiService = Get.find();
  final AuthService _authService = Get.find();
  final steps = 0.obs;
  final walkingStatus = WalkingStatus.stopped.obs;

  late StreamSubscription _stepsSub, _statusSub;

  @override
  void onInit() async {
    steps.bindStream(
      _apiService.userTotalStepsStream(_authService.authFireStoreRef.id),
    );
    _stepsSub = _pedometerSource.stepCountStream.listen((event) {
      _apiService.updateUserTotalSteps(
          _authService.authFireStoreRef.id, steps.value + 1);
    });

    _statusSub = _pedometerSource.pedestrianStatusStream.listen((event) {
      walkingStatus.value = event;
    });

    ever<int>(steps, (val) {
      if (val % 20 == 0) {
        _apiService.exchangeStepsForPoints(
          _authService.authFireStoreRef.id,
          20,
          5,
        );
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(Icons.monetization_on_sharp),
            title: "Congrats !",
            message: "You gained 10 points",
            isDismissible: true,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    _statusSub.cancel();
    _stepsSub.cancel();
    super.onClose();
  }
}
