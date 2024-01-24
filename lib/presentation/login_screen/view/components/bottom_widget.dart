import 'package:flutter/material.dart';
import 'package:task_tracker/theme/custom_text_styles.dart';

bottomWidget() {
  return Center(
    child: RichText(
        text: TextSpan(children: [
          const TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.black)),
          const TextSpan(text: " "),
          TextSpan(text: "Sign Up", style: CustomTextStyles.labelLargePrimary_2)
        ]),
        textAlign: TextAlign.left),
  );
}
