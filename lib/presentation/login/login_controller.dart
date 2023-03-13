import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/app_routes.dart';
import '../../resources/app_value_resource.dart';
import '../../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> loginUser()async{
      try {
        var url = Uri.parse(APIEndPoints.baseUrl + APIEndPoints.userEndPoint.login);
        Map body = {
          'email': emailController.value.text.trim(),
          'mobile_num':"",
        };
        print(body.toString());
        http.Response response = await http.post(url, body: jsonEncode(body), headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },);
        print("body of  v_code ${body['v_code']}");
        print("Response from url ${response.body}");
        print("Info From  Url $url");
        print(response.body.toString());
        
        if (response.statusCode == 200) {
          print("response body 200 of  v_code ${body['v_code']}");
          print("Response after 200 from url ${response.body}");
          print("Info From 200 response  Url $url");
          final json = jsonDecode(response.body);
          /* if (json['data']['acc_status'] == 'inactive') {
          var v_code = json['data']['properties']['v_code'];*/
          //await prefs?.setString("v_code", v_code);
          emailController.clear();
          phoneNumberController.clear();
          //Get.toNamed(Routes.otpScreen);
          /*}else{
          throw jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        }*/
        }else{
          //throw UserRegistrationResponse.fromJson(jsonDecode(response.body)[''message'']);
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