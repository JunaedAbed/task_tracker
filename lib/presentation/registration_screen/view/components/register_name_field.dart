import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/core/utils/validation_functions.dart';
import 'package:task_tracker/presentation/registration_screen/controller/registration_controller.dart';
import 'package:task_tracker/widgets/custom_text_form_field.dart';

registerNameField(RegistrationController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Name",
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
      ),
      SizedBox(height: 14.v),
      CustomTextFormField(
        controller: controller.nameController,
        hintText: "Type name here",
        textInputType: TextInputType.text,
        prefixConstraints: BoxConstraints(maxHeight: 54.v),
        validator: (value) {
          if (value == null || (!isText(value, isRequired: true))) {
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
