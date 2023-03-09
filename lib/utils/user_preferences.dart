import 'dart:convert';

import 'package:conversations/model/userProfileData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static late SharedPreferences _sharedPreferences;
  static const _keyUser = 'user';

  static  UserProfile myUser = UserProfile(
      userId: 1,
      about: "I am a Mobile developer, Working with 5+ yrs with Java and Flutter, Also a Certified Web Developer",
      dob: "23/05/2023",
      fName: "Dennis",
      lName: "Dennis",
      gender: "male",
      locationId: 0,
      occupation: "Software Developer",
      instagramUsername: "to be added",

      isDarkMode: false);

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