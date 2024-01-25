import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';

Text registerTopWidget() {
  return Text(
    "Sign Up",
    style: theme.textTheme.titleMedium?.copyWith(fontSize: 32.fSize),
  );
}
