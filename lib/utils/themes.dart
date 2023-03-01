import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/material.dart';

import '../resources/app_color.dart';


  final ThemeData appThemeData = ThemeData(
      primaryColor: AppColor.primaryColor,
      primaryColorLight: AppColor.primaryColorLight,
      disabledColor: AppColor.grey,
      dividerColor: AppColor.balck,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.primaryColor),
      textTheme: TextTheme(headline1: getBoldTextStyle(fontSize: AppSize.s64, color: AppColor.white)),
  );

final ThemeData darkThemeData = ThemeData(
    primaryColorDark: AppColor.primaryColorLight,
    dividerColor: AppColor.white,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(headline1: getBoldTextStyle(fontSize: AppSize.s64, color: AppColor.white)),

);
