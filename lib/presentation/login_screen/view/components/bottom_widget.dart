import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/theme/custom_text_styles.dart';

bottomWidget() {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRoutes.registerScreen),
    child: Center(
      child: RichText(
          text: TextSpan(children: [
            const TextSpan(
                text: "Don't have an account?",
                style: TextStyle(color: Colors.black)),
            const TextSpan(text: " "),
            TextSpan(
                text: "Sign Up", style: CustomTextStyles.labelLargePrimary_2)
          ]),
          textAlign: TextAlign.left),
    ),
  );
}
