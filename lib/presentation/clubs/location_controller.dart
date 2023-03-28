import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/api_endpoints.dart';
import 'package:http/http.dart'as http;

class FetchAlLLocationController extends GetxController{

  RxBool isLoading = false.obs;

  Future<void> getLocation()async{
    isLoading = true.obs;
    try{
      var url = Uri.parse(APIEndPoints.baseUrl + APIEndPoints.userEndPoint.fetchAllLocation);


    }catch(e){

    }
  }
}