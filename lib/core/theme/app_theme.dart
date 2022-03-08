import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_todo_manabie/core/theme/dark_theme.dart';
import 'package:test_todo_manabie/core/theme/light_theme.dart';
import 'package:test_todo_manabie/core/theme/text_theme.dart';
import 'package:test_todo_manabie/core/values/app_color.dart';

class AppTheme {
  static ThemeData getAppTheme(bool isDarkMode) => isDarkMode
      ? _configThemeData(DarkTheme.colorScheme, AppColor.accent)
      : _configThemeData(LightTheme.colorScheme, AppColor.accent);

  static ThemeData _configThemeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: AppTextTheme.mainTextTheme,
      errorColor: AppColor.getErrorColor(),
      // Matches manifest.json colors and background color.
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
        // titleTextStyle: ,
        iconTheme: const IconThemeData(color: AppColor.titleColor),
        brightness: colorScheme.brightness,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(color: AppColor.titleColor),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      hintColor: AppColor.lightHintColor,
      disabledColor: AppColor.lightDisableColor,
      backgroundColor: AppColor.lightBackgroundColor,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        titleTextStyle: AppTextTheme.mainTextTheme.headline6,
        contentTextStyle: AppTextTheme.mainTextTheme.bodyText1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.secondary,
        selectedLabelStyle: AppTextTheme.mainTextTheme.bodyText1,
        selectedItemColor: colorScheme.primary,
        unselectedLabelStyle: AppTextTheme.mainTextTheme.bodyText1!
            .copyWith(color: AppColor.lightDisableColor),
        unselectedItemColor: AppColor.lightDisableColor,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: colorScheme.primary),
        ),
        buttonColor: colorScheme.primary,
        padding: const EdgeInsets.only(left: 16, right: 16),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          AppColor.lightFillColor.withOpacity(0.80),
          AppColor.darkFillColor,
        ),
        contentTextStyle: AppTextTheme.mainTextTheme.subtitle1!
            .apply(color: AppColor.darkFillColor),
      ),
    );
  }
}
