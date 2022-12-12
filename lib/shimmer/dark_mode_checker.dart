import 'package:flutter/material.dart';

bool isDarkMode() {
  final darkMode = WidgetsBinding.instance.window.platformBrightness;
  if (darkMode == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}