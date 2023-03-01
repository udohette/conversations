import 'dart:async';

import 'package:conversations/resources/app_assets.dart';
import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_routes.dart';
import 'package:conversations/resources/app_strings.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), () => _goNext());
  }

  _goNext(){
    Get.toNamed(Routes.loginOrRegister);
    //Navigator.pushReplacementNamed(context, Routes.loginOrRegister);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
  _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.grey,
        body: Stack(
            alignment: Alignment.center,
            children: [
              Center(child: Image(image: AssetImage(AppAssets.splashLogo)),),
              Positioned(
                  bottom:350,
                  child:
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.baseline,
                    children: [
                      Text(AppStrings.appTitle, style: getBoldTextStyle(fontSize: AppSize.s30, color: AppColor.balck),),
                      Text(AppStrings.dot, style: getBoldTextStyle(fontSize: AppSize.s120, color: AppColor.primaryColorLight),)

                    ],)
              )

            ])
    );
  }
}
