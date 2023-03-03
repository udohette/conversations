import 'dart:convert';

import 'package:conversations/resources/app_routes.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:conversations/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController{
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  var header  ='application/json';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerEmail()async{
    try {
      var headers = {'Content-Type': header};
      var url = Uri.parse(
          APIEndPoints.baseUrl + APIEndPoints.userEndPoint.registerEmail);
      Map body = {
        'email': emailController.text.trim(),
        'mobile_num': phoneNumberController.text,
        'password': passwordController.text,
        'token': tokenController.text,
        'user_name': userNameController.text
      };
      http.Response response = await http.post(
          url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['data']['acc_status'] == 'inactive') {
          var v_code = json['data']['properties']['v_code'];

          print(v_code);
          print(v_code);
          print(v_code);
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString("v_code", v_code);
          emailController.clear();
          passwordController.clear();
          phoneNumberController.clear();
          tokenController.clear();
          userNameController.clear();
        }else{
          throw jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        }
      }else{
        throw jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
      }
      
    }catch(e){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text("Error"),
          contentPadding: EdgeInsets.all(AppPadding.p20,),
          children: [Text(e.toString())],
            
        );
        
      });
    }
  }
}