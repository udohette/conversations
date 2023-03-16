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
  RxBool isLoading = false.obs;

  Future<void> loginUser()async{
    isLoading.value = true;
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

        try{
          if (response.statusCode == 200) {
            isLoading.value = false;
            print("response body 200 of  v_code ${body['v_code']}");
            print("Response after 200 from url ${response.body}");
            print("Info From 200 response  Url $url");
            String user_id = "${jsonDecode(response.body)['data'][0]['identity']['low'] as int}";
            print("user_id user_id $user_id");
            print("response.statusCode ${response.statusCode}");

            Get.toNamed(Routes.otpScreen, arguments: [
              {"userId": user_id},
              {"email": emailController.value.text}
            ]);
            emailController.clear();
            phoneNumberController.clear();

          }else{
            isLoading.value = false;
            showDialog(context: Get.context!, builder: (context){
              return SimpleDialog(
                title: const Text("Error"),
                contentPadding: const EdgeInsets.all(AppPadding.p20,),
                children: [Text(jsonDecode(response.body)['message'] ?? "Unknown Error Occurred")],
              );
            });
            //throw UserRegistrationResponse.fromJson(jsonDecode(response.body)[''message'']);
            throw jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
          }

        }catch(e){
          isLoading.value = false;
          showDialog(context: Get.context!, builder: (context){
            return SimpleDialog(
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(AppPadding.p20,),
              children: [Text(jsonDecode(response.body)['message'] ?? "Unknown Error Occurred")],
            );
          });

        }

      }catch(e){
        isLoading.value = false;
        //Get.back();
       e.printError();
      }
    }
  }