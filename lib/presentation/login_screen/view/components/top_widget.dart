import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';

Text topWidget() {
  return Text(
    "Sign In",
    style: theme.textTheme.titleMedium?.copyWith(fontSize: 32.fSize),
  );
}
