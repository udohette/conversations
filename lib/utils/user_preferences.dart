import 'dart:convert';

import 'package:conversations/model/userProfileData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static late SharedPreferences _sharedPreferences;
  static const _keyUser = 'user';
  static  UserProfile myUser = UserProfile(
    imagePath: "https://images.unsplash.com/photo-1676896007103-7d8b546f8899?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=745&q=80",
      name: "Dennis Conversations",
      email: "info@etteinnovations.com",
      phone: "+91 809765439",
      about: "I am a Mobile developer, Working with 5+ yrs with Java and Flutter, Also a Certified Web Developer",
      isDarkMode: false,
  );
  static Future init()async{
     _sharedPreferences = await SharedPreferences.getInstance();
  }
    static Future setUser(UserProfile userProfile)async{
    final json = jsonEncode(userProfile.toJson());
    await _sharedPreferences.setString(_keyUser, json);
  }
  static UserProfile getUser(){
    final json = _sharedPreferences.getString(_keyUser);
    return json == null ? myUser: UserProfile.fromJson(jsonDecode(json));
  }
}