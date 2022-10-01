import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class AuthDispatcherController extends GetxController {
  final AuthService _authService = Get.find();
  @override
  void onInit() async {
    ever<AuthState>(_authService.authState, (state) async {
      final to = state == AuthState.authed ? "/home_page" : "/signup";
      if (state == AuthState.authed) {
        await _authService.ensureInit();
      }
      Get.offNamedUntil(
        to,
        (route) => route.settings.name == "auth_dispatcher",
      );
    });
    super.onInit();
  }
}
