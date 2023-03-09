// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {

  int userId;
  String about;
  String dob;
  String fName;
  String lName;
  String gender;
  int locationId;
  String occupation;
  String instagramUsername;
  bool isDarkMode;


  UserProfile({required this.userId, required this.about, required this.dob, required this.fName, required this.lName,
    required this.gender,
    required this.locationId,
    required this.occupation,
    required this.instagramUsername,
    required this.isDarkMode,
  });
  UserProfile copyWith({
    int? userId,
    String? about,
    String? dob,
    String? fName,
    String? lName,
    String? gender,
    int? locationId,
    String? occupation,
    String? instagramUsername,
    bool? isDarkMode,
  }) =>
      UserProfile(
        userId: userId ?? this.userId,
        about: about ?? this.about,
        dob: dob ?? this.dob,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        gender: gender ?? this.gender,
        locationId: locationId ?? this.locationId,
        occupation: occupation ?? this.occupation,
        instagramUsername: instagramUsername ?? this.instagramUsername,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    userId: json["user_id"],
    about: json["about"],
    dob: json["dob"],
    fName: json["f_name"],
    lName: json["l_name"],
    gender: json["gender"],
    locationId: json["location_id"],
    occupation: json["occupation"],
    instagramUsername: json["instagram_username"],
    isDarkMode: json["isDarkMode"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "about": about,
    "dob": dob,
    "f_name": fName,
    "l_name": lName,
    "gender": gender,
    "location_id": locationId,
    "occupation": occupation,
    "instagram_username": instagramUsername,
    "isDarkMode": isDarkMode,
  };
}
