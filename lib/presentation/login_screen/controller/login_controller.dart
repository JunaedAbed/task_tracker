import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/services/auth/auth_repository.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';
import 'package:task_tracker/presentation/login_screen/models/login_request_model.dart';

class LoginController extends GetxController {
  final AuthRepositoryInterface _authRepo = AuthRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    var response = await _authRepo.login(LoginRequestModel(
        email: emailController.text, password: passwordController.text));

    if (response.token!.isNotEmpty) {
      Get.toNamed(AppRoutes.dashboardScreen);
    }
  }
}
