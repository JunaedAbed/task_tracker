import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/login_screen/controller/login_controller.dart';
import 'package:task_tracker/presentation/login_screen/view/components/bottom_widget.dart';
import 'package:task_tracker/presentation/login_screen/view/components/email_field.dart';
import 'package:task_tracker/presentation/login_screen/view/components/password_field.dart';
import 'package:task_tracker/presentation/login_screen/view/components/top_widget.dart';
import 'package:task_tracker/widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 180.adaptSize,
          backgroundColor: theme.colorScheme.background,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.appbarBg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: null,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 28.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topWidget(),
              SizedBox(height: 42.v),
              emailField(controller),
              SizedBox(height: 28.v),
              passwordField(controller),
              SizedBox(height: 28.v),
              CustomElevatedButton(
                  text: "Sign In", onPressed: () => controller.signIn()),
              SizedBox(height: 28.v),
              bottomWidget()
            ],
          ),
        ),
      ),
    );
  }
}
