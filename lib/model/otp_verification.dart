// To parse this JSON data, do
//
//     final otpVerification = otpVerificationFromJson(jsonString);

import 'dart:convert';

OtpVerification otpVerificationFromJson(String str) => OtpVerification.fromJson(json.decode(str));

String otpVerificationToJson(OtpVerification data) => json.encode(data.toJson());

class OtpVerification {
  OtpVerification({
    required this.userId,
    required this.vCode,
  });

  int userId;
  String vCode;

  OtpVerification copyWith({
     int? userId,
     String? vCode,
  }) =>
      OtpVerification(
        userId: userId ?? this.userId,
        vCode: vCode ?? this.vCode,
      );

  factory OtpVerification.fromJson(Map<String, dynamic> json) => OtpVerification(
    userId: json["user_id"],
    vCode: json["v_code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "v_code": vCode,
  };
}
