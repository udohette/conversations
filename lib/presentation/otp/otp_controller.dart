import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/app_value_resource.dart';
import '../../utils/api_endpoints.dart';

class OTPController extends GetxController{
  TextEditingController v_code = TextEditingController();
  String user_id = '';


  Future<void> otpVerification()async{
    try {
      var url = Uri.parse(APIEndPoints.baseUrl + APIEndPoints.userEndPoint.userActivation);
      Map body = {
        'user_id': user_id.toString(),
        'v_code': v_code.value.text
      };
      http.Response response = await http.post(url, body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'},
      );
      print("body of  v_code ${body['v_code']}");
      print("Response from url ${response.body}");
      print("Info From  Url $url");
      print("Response UserId from Registration $user_id}");
      print("Response Message one: ${jsonDecode(response.body)['message']}");
      String errorMsg = "${jsonDecode(response.body)['message']}";

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('errorMsg', errorMsg);

      if (response.statusCode == 200) {
        v_code.clear();
        print(response.body.toString());
        print("Response UserId from Registration $user_id}");
        print("Response Message two: ${jsonDecode(response.body)['message']}");
        //Text("Success Message ${response.body['message']}")
       // print("Success Message ${response.body['message']}");

      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
      }
    }catch(e){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: const Text("Error"),
          contentPadding: const EdgeInsets.all(AppPadding.p20,),
          children: [Text(e.toString())],
        );
      });

    }

  }
}