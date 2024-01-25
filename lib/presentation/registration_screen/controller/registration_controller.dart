import 'package:flutter/widgets.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/services/auth/auth_repository.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';
import 'package:task_tracker/presentation/registration_screen/models/register_request_model.dart';

class RegistrationController extends GetxController {
  final AuthRepositoryInterface _authRepo = AuthRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  signUp() async {
    var response = await _authRepo.register(RegisterRequestModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      age: 0,
    ));

    print(response);

    if (response.token!.isNotEmpty) {
      Get.offNamed(AppRoutes.loginScreen);
    }
  }
}
