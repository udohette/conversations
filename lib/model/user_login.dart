// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {

  String email;
  int? mobileNum;
  String? token;

  UserLogin({required this.email, this.mobileNum, this.token,}
      );



  UserLogin copyWith({
     String? email,
     int? mobileNum,
     String? token,
  }) =>
      UserLogin(
        email: email ?? this.email,
        mobileNum: mobileNum ?? this.mobileNum,
        token: token ?? this.token,
      );

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    email: json["email"],
    mobileNum: json["mobile_num"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "mobile_num": mobileNum,
    "token": token,
  };
}
