// To parse this JSON data, do
//
//     final getUserProfile = getUserProfileFromJson(jsonString);

import 'dart:convert';

GetUserProfile getUserProfileFromJson(String str) => GetUserProfile.fromJson(json.decode(str));

String getUserProfileToJson(GetUserProfile data) => json.encode(data.toJson());

class GetUserProfile {
  int userId;

  GetUserProfile({
    required this.userId,
  });


  GetUserProfile copyWith({
     int? userId,
  }) =>
      GetUserProfile(
        userId: userId ?? this.userId,
      );

  factory GetUserProfile.fromJson(Map<String, dynamic> json) => GetUserProfile(
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
  };
}
