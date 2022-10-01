import 'package:flutter_steps_tracker/services/api_service/api_service.dart';
import 'package:flutter_steps_tracker/services/api_service/models/point_exchange.dart';
import 'package:flutter_steps_tracker/services/api_service/models/redeem.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class WalletScreenController extends GetxController {
  final ApiService _apiService = Get.find();
  final AuthService _authService = Get.find();

  final redeems = <Redeem>[].obs;
  final points = <PointExchange>[].obs;
  final totalPoints = 0.obs;

  @override
  void onInit() {
    redeems.bindStream(
      _apiService.userRedeemsStream(_authService.authFireStoreRef.id),
    );
    points.bindStream(
        _apiService.userPointExchangesStream(_authService.authFireStoreRef.id));

    totalPoints.bindStream(
        _apiService.userTotalPoints(_authService.authFireStoreRef.id));
    super.onInit();
  }
}
