import 'dart:convert';
import 'package:conversations/resources/app_routes.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:conversations/utils/api_endpoints.dart';
import 'package:flutter/foundation.dart';
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
  //late RxString completeNumber obs;
  var header  ='application/json';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxString controllerText = ''.obs;
  String message = '';

  Future<void> registerEmail()async{
    var url = Uri.parse(APIEndPoints.baseUrl + APIEndPoints.userEndPoint.registerEmail);
    Map body = {
      'email': emailController.value.text.trim(),
      'mobile_num': "",
      'password': "",
      'token': "",
      'user_name': emailController.value.text.trim(),
    };
    print(body.toString());
    http.Response response = await http.post(url, body: jsonEncode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    },);
    print(response.body.toString());


    try {
      if (response.statusCode == 200) {
        print("Response Data ${response.body.toString()}");
        print("Response Message: ${jsonDecode(response.body)['data']}");
        print("Response and Identity Data 0 ${jsonDecode(response.body)['data'][0]['identity']['low'] as int}");


        print("Response and User Id Data 1 ${jsonDecode(response.body)['data'][0]['properties']['user_id'] as int}");

        String user_id  ="${jsonDecode(response.body)['data'][0]['properties']['user_id'] as int}";
         message = "${jsonDecode(response.body)['data']}";

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('user_id', user_id);
        pref.setString("message", message);

        print("user_id user_id user_id $user_id");

        final SharedPreferences prefs = await _prefs;
        Get.toNamed(Routes.otpScreen, arguments: [
          {"userId": user_id},
          {"email": emailController.value.text}
        ]);
        emailController.clear();
        passwordController.clear();
        phoneNumberController.clear();
        tokenController.clear();
        userNameController.clear();
      }else{
        showDialog(context: Get.context!, builder: (context){
          return SimpleDialog(
            title: const Text("Error"),
            contentPadding: const EdgeInsets.all(AppPadding.p20,),
            children: [Text(jsonDecode(response.body)['data'] ?? "DB Error")],
          );
        });
      }

    }catch(e){
      //Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: const Text("Oops!"),
          contentPadding: const EdgeInsets.all(AppPadding.p20,),
          children: [Text(jsonDecode(response.body)['data'] ?? "DB Error")],
        );
      });
    }
  }
}