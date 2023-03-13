// To parse this JSON data, do
//
//     final userRegistrationResponse = userRegistrationResponseFromJson(jsonString);

import 'dart:convert';

UserRegistrationResponse userRegistrationResponseFromJson(String str) => UserRegistrationResponse.fromJson(json.decode(str));

String userRegistrationResponseToJson(UserRegistrationResponse data) => json.encode(data.toJson());

class UserRegistrationResponse {
  UserRegistrationResponse({
    required this.data,
    required this.message,
  });

  List<Datum> data;
  String message;

  UserRegistrationResponse copyWith({
    List<Datum>? data,
    String? message,
  }) =>
      UserRegistrationResponse(
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) => UserRegistrationResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.identity,
    required this.labels,
    required this.properties,
    required this.elementId,
  });

  Identity identity;
  List<String> labels;
  Properties properties;
  String elementId;

  Datum copyWith({
    Identity? identity,
    List<String>? labels,
    Properties? properties,
    String? elementId,
  }) =>
      Datum(
        identity: identity ?? this.identity,
        labels: labels ?? this.labels,
        properties: properties ?? this.properties,
        elementId: elementId ?? this.elementId,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    identity: Identity.fromJson(json["identity"]),
    labels: List<String>.from(json["labels"].map((x) => x)),
    properties: Properties.fromJson(json["properties"]),
    elementId: json["elementId"],
  );

  Map<String, dynamic> toJson() => {
    "identity": identity.toJson(),
    "labels": List<dynamic>.from(labels.map((x) => x)),
    "properties": properties.toJson(),
    "elementId": elementId,
  };
}

class Identity {
  Identity({
    required this.low,
    required this.high,
  });

  int low;
  int high;

  Identity copyWith({
    int? low,
    int? high,
  }) =>
      Identity(
        low: low ?? this.low,
        high: high ?? this.high,
      );

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
    low: json["low"],
    high: json["high"],
  );

  Map<String, dynamic> toJson() => {
    "low": low,
    "high": high,
  };
}

class Properties {
  Properties({
    required this.passwordSalt,
    required this.password,
    required this.mobileNum,
    required this.vCode,
    required this.userType,
    required this.userName,
    required this.vCodeExpiry,
    required this.accStatus,
    required this.email,
    required this.dateRegistered,
    required this.token,
    required this.userId,
  });

  String passwordSalt;
  String password;
  String mobileNum;
  String vCode;
  Identity userType;
  String userName;
  String vCodeExpiry;
  String accStatus;
  String email;
  String dateRegistered;
  String token;
  int userId;

  Properties copyWith({
    String? passwordSalt,
    String? password,
    String? mobileNum,
    String? vCode,
    Identity? userType,
    String? userName,
    String? vCodeExpiry,
    String? accStatus,
    String? email,
    String? dateRegistered,
    String? token,
    int? userId,
  }) =>
      Properties(
        passwordSalt: passwordSalt ?? this.passwordSalt,
        password: password ?? this.password,
        mobileNum: mobileNum ?? this.mobileNum,
        vCode: vCode ?? this.vCode,
        userType: userType ?? this.userType,
        userName: userName ?? this.userName,
        vCodeExpiry: vCodeExpiry ?? this.vCodeExpiry,
        accStatus: accStatus ?? this.accStatus,
        email: email ?? this.email,
        dateRegistered: dateRegistered ?? this.dateRegistered,
        token: token ?? this.token,
        userId: userId ?? this.userId,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    passwordSalt: json["password_salt"],
    password: json["password"],
    mobileNum: json["mobile_num"],
    vCode: json["v_code"],
    userType: Identity.fromJson(json["user_type"]),
    userName: json["user_name"],
    vCodeExpiry: json["v_code_expiry"],
    accStatus: json["acc_status"],
    email: json["email"],
    dateRegistered: json["date_registered"],
    token: json["token"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "password_salt": passwordSalt,
    "password": password,
    "mobile_num": mobileNum,
    "v_code": vCode,
    "user_type": userType.toJson(),
    "user_name": userName,
    "v_code_expiry": vCodeExpiry,
    "acc_status": accStatus,
    "email": email,
    "date_registered": dateRegistered,
    "token": token,
    "user_id": userId,
  };
}
