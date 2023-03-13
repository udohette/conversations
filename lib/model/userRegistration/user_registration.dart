// To parse this JSON data, do
//
//     final userRegistration = userRegistrationFromJson(jsonString);

import 'dart:convert';

UserRegistration userRegistrationFromJson(String str) => UserRegistration.fromJson(json.decode(str));

String userRegistrationToJson(UserRegistration data) => json.encode(data.toJson());

class UserRegistration {
  String email;
  dynamic mobileNum;
  String? password;
  String? token;
  String? userName;

  UserRegistration({
    required this.email,
    this.mobileNum,
     this.password,
     this.token,
     this.userName,
  });

  UserRegistration copyWith({
    String? email,
    dynamic mobileNum,
    String? password,
    String? token,
    String? userName,
  }) =>
      UserRegistration(
        email: email ?? this.email,
        mobileNum: mobileNum ?? this.mobileNum,
        password: password ?? this.password,
        token: token ?? this.token,
        userName: userName ?? this.userName,
      );

  factory UserRegistration.fromJson(Map<String, dynamic> json) => UserRegistration(
    email: json["email"],
    mobileNum: json["mobile_num"],
    password: json["password"],
    token: json["token"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "mobile_num": mobileNum,
    "password": password,
    "token": token,
    "user_name": userName,
  };
}
