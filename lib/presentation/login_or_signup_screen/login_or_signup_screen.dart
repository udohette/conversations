import 'package:conversations/presentation/login/loginPage.dart';
import 'package:conversations/presentation/register/registerPage.dart';
import 'package:conversations/resources/app_routes.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/app_strings.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.grey,
        body: SafeArea(
            child: Padding(padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                child: Column(
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(child: Image(image: AssetImage(AppAssets.splashLogo)),),
                        Positioned(
                            bottom:80,
                            child:
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:CrossAxisAlignment.baseline,
                              children: [
                                Text(AppStrings.appTitle, style: getBoldTextStyle(fontSize: AppSize.s25, color: AppColor.balck),),
                                Text(AppStrings.dot, style: getBoldTextStyle(fontSize: AppSize.s120, color: AppColor.primaryColorLight),)

                              ],)
                        )

                      ]),
                  SizedBox(height: AppSize.s18,),
                  Text(AppStrings.let_get_started, style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.balck),),
                  SizedBox(height: AppSize.s10,),
                  Text(AppStrings.never_a_better_time, style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.black38),),
                  SizedBox(height: AppSize.s38,),
                  SizedBox(height:AppSize.s60,width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.toNamed(Routes.registerRoute);
                  },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(AppColor.primaryColorLight),
                        foregroundColor: MaterialStatePropertyAll(AppColor.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s25)))
                      ),
                      child: Padding(padding: EdgeInsets.all(AppPadding.p14), child: Text(AppStrings.register),)
                  )
                    ,),
                  SizedBox(height: AppSize.s20,),
                  SizedBox(height:AppSize.s60, width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Get.toNamed(Routes.loginRoute,);
                    },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(AppColor.white),
                            foregroundColor: MaterialStatePropertyAll(AppColor.primaryColorLight),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s25)))
                        ),
                        child: Padding(padding: EdgeInsets.all(AppPadding.p14), child: Text("Login"),)
                    )
                    ,),
              ],
            )
            ),
        ),
      );
  }
}
