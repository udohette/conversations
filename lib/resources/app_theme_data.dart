

import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData  getApplicationTheme(){

  return ThemeData(
    // main color of the App
    primaryColor: AppColor.primaryColor,
    primaryColorLight: AppColor.primaryColorLight,
    splashColor: AppColor.primaryColorLight,
    disabledColor: AppColor.grey,
    dividerColor: AppColor.balck,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.primaryColor),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade300,
      foregroundColor: Colors.black54,
    )
  );
}
