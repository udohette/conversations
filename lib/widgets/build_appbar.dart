
import 'package:conversations/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildAppBar(BuildContext context){
  const icon = CupertinoIcons.moon_stars;
  final user = UserPreference.getUser();
  final isDarkMode = user.isDarkMode;
  return AppBar(
    leading: BackButton(color: Colors.grey),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [IconButton(onPressed: (){
      Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
      final newUser = user.copy(isDarkMode: !isDarkMode);
      UserPreference.setUser(newUser);
    }, icon: Get.isDarkMode?  Icon(CupertinoIcons.moon_stars,): Icon(CupertinoIcons.moon_stars, color: Colors.grey,))],
  );
}