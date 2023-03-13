import 'package:conversations/presentation/homePage/homaPage.dart';
import 'package:conversations/presentation/mainPage/mainPage.dart';
import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_styles.dart';
import '../../resources/app_value_resource.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                    width: MediaQuery.of(context).size.width,
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
                Text(AppStrings.welcomeBack, style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.balck),),
                SizedBox(height: AppSize.s10,),
                SizedBox(height: AppSize.s38,),

                Container(
                  padding: EdgeInsets.all(AppPadding.p28),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Column(
                    children: [
                      IntlPhoneField(
                        pickerDialogStyle: PickerDialogStyle(backgroundColor: AppColor.grey),
                        keyboardType: TextInputType.phone,
                        cursorColor: AppColor.primaryColor,
                        dropdownIcon: const Icon(Icons.arrow_drop_down, color: AppColor.primaryColor,),
                        style: TextStyle(color: AppColor.primaryColor),
                        decoration: InputDecoration(
                          labelStyle: getRegularTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColor),
                          suffixIcon: Icon(Icons.check_circle, color: Colors.green,size: AppSize.s30,),
                          enabled: true,
                          // label: Text("phone Number"),
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30) ,
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(30) ,
                              borderSide: BorderSide(color: AppColor.primaryColor)),
                        ),
                        initialCountryCode: "India",
                        onChanged: (phone) {
                          //when phone number country code is changed
                          print(phone.completeNumber); //get complete number
                          print(phone.countryCode); // get country code only
                          print(phone.number); // only phone number
                        },
                      ),
                      SizedBox(height: 22,),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: true,
                        style: getRegularTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColor),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email, color: AppColor.primaryColorLight,),
                          labelStyle: getRegularTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColor),
                          suffixIcon: const Icon(Icons.check_circle, color: Colors.green,size: AppSize.s30,),
                          enabled: true,
                          // label: Text("phone Number"),
                          hintText: "Email Address",
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30) ,
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(30) ,
                              borderSide: const BorderSide(color: AppColor.primaryColor)),
                        ),

                      ),
                      SizedBox(height: 22,),
                      SizedBox(
                        height: AppSize.s60,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MainPage()));
                            },
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(AppColor.primaryColorLight),
                                foregroundColor: const MaterialStatePropertyAll(AppColor.white),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s25)))
                            ),
                            child: const Padding(padding: EdgeInsets.all(AppPadding.p14), child: Text(AppStrings.login),)
                        )
                        ,),
                    ],
                  ),
                ),
                const SizedBox(height: 22,),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: AppStrings.byEntering,
                        style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.black38,),
                      ),
                      TextSpan(
                          text: AppStrings.termsOfService,
                          style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.blue,),
                          recognizer: TapGestureRecognizer()..onTap =() {
                            launch("https://etteinnovations.com/");
                          }
                      ),
                      TextSpan(
                        text: " and our ",
                        style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.black38,),
                      ),
                      TextSpan(
                        text: AppStrings.privacy,
                        style: getBoldTextStyle(fontSize: AppSize.s14, color: Colors.blue,),
                        recognizer: TapGestureRecognizer()..onTap =() {
                          launchUrl(Uri.https("https://etteinnovations.com/"));
                        }
                      ),
                    ])),
              ],
            )
        ),

      ),
    );
  }
}
