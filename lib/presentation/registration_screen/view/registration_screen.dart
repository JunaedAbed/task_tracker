import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/registration_screen/components/register_email_field.dart';
import 'package:task_tracker/presentation/registration_screen/components/register_name_field.dart';
import 'package:task_tracker/presentation/registration_screen/components/register_retype_pass_field.dart';
import 'package:task_tracker/presentation/registration_screen/components/register_top_widget.dart';
import 'package:task_tracker/presentation/registration_screen/controller/registration_controller.dart';
import 'package:task_tracker/widgets/custom_elevated_button.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
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
              registerTopWidget(),
              SizedBox(height: 42.v),
              registerNameField(controller),
              SizedBox(height: 28.v),
              registerEmailField(controller),
              SizedBox(height: 28.v),
              registerEmailField(controller),
              SizedBox(height: 28.v),
              registerRetypePassField(controller),
              SizedBox(height: 28.v),
              CustomElevatedButton(text: "Sign Up", onPressed: () {}),
              SizedBox(height: 28.v),
            ],
          ),
        ),
      ),
    );
  }
}
