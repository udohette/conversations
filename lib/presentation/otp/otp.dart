import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_styles.dart';
import '../../resources/app_value_resource.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black54, size: AppSize.s30,),
                  ),
                ),
                Container(
                    height: AppSize.s200,
                    width: AppSize.s200,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(child: Image(image: AssetImage(AppAssets.splashLogo)),),
                          Positioned(
                              bottom:20,
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
                ),
                SizedBox(height: AppSize.s18,),
                Text(AppStrings.verification, style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.balck),),
                SizedBox(height: AppSize.s10,),
                Text(AppStrings.otpCodeMessage, textAlign: TextAlign.center, style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.black38,),),
                SizedBox(height: AppSize.s38,),
                Container(
                  padding: EdgeInsets.all(AppPadding.p28),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        _textfieldOTP(first: true, last: false),
                        _textfieldOTP(first: false, last: false),
                        _textfieldOTP(first: false, last: false),
                        _textfieldOTP(first: true, last: true),
                        ],
                      ),
                      SizedBox(height: 22,),
                      SizedBox(width: double.infinity,
                        child: ElevatedButton(onPressed: (){

                        },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(AppColor.primaryColorLight),
                                foregroundColor: MaterialStatePropertyAll(AppColor.white),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s25)))
                            ),
                            child: Padding(padding: EdgeInsets.all(AppPadding.p14), child: Text(AppStrings.verify),)
                        )
                        ,),
                    ],
                  ),

                ),
                SizedBox(height: AppSize.s12,),
                    Text("Didn't your receive any code?", style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.black38),),
                    SizedBox(height: AppSize.s18,),
                    Text("Resend new Code", style: getBoldTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColor),)

              ],
            )
        ),
      ),
    );
  }
  _textfieldOTP({required bool first, last}){
    return Container(
      height: AppSize.s85,
      child: AspectRatio(
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if(value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 0 && first == false){
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: getBoldTextStyle(fontSize: AppSize.s25, color: AppColor.balck),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(AppSize.s12)
            ),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(AppSize.s12)),
          ),
        ),
          aspectRatio: 0.7),

    );

  }
}
