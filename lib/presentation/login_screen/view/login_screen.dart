import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/login_screen/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(),
    );
  }
}
