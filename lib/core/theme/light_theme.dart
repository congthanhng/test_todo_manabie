import 'package:flutter/material.dart';
import 'package:test_todo_manabie/core/values/app_color.dart';
import 'package:test_todo_manabie/core/values/app_elevation.dart';

class LightTheme{
  static const ColorScheme colorScheme =  ColorScheme(
    primary: AppColor.app_main,
    primaryVariant: Color(0xFF117378),
    secondary: AppColor.accent,
    secondaryVariant: Color(0xFFFAFBFB),
    background: AppColor.surface,
    surface: AppColor.surface,
    onBackground: AppColor.surface,
    error: AppColor.lightFillColor,
    onError: AppColor.lightFillColor,
    onPrimary: AppColor.lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
}