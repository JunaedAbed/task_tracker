import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/core/utils/validation_functions.dart';
import 'package:task_tracker/presentation/login_screen/controller/login_controller.dart';
import 'package:task_tracker/widgets/custom_text_form_field.dart';

emailField(LoginController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email",
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
      ),
      SizedBox(height: 14.v),
      CustomTextFormField(
        controller: controller.emailController,
        hintText: "Type email here",
        textInputType: TextInputType.emailAddress,
        prefixConstraints: BoxConstraints(maxHeight: 54.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "Please enter valid email";
          }
          return null;
        },
        contentPadding:
            EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v, left: 15.v),
      ),
    ],
  );
}
