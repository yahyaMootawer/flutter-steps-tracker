import 'package:flutter/cupertino.dart';
import 'package:flutter_steps_tracker/app/utils/dialogs.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find();

  final nameFieldController = TextEditingController();

  final isLoading = false.obs;

  void signup() async {
    isLoading.value = true;
    Dialogs.pushLoadingDialog(() {});
    await _authService.signup(nameFieldController.text);
    if (Get.isDialogOpen ?? false) Get.back();
    isLoading.value = false;
  }
}
