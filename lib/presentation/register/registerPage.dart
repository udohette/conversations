import 'package:conversations/presentation/otp/otp.dart';
import 'package:conversations/presentation/register/registration_controller.dart';
import 'package:conversations/resources/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_styles.dart';
import '../../resources/app_value_resource.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegistrationController controller = Get.put(RegistrationController());
  late String completeNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                      size: AppSize.s30,
                    ),
                  ),
                ),
                Container(
                    height: AppSize.s200,
                    width: AppSize.s200,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle),
                    child: Stack(alignment: Alignment.center, children: [
                      const Center(
                        child: Image(image: AssetImage(AppAssets.splashLogo)),
                      ),
                      Positioned(
                          bottom: 20,
                          child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                AppStrings.appTitle,
                                style: getBoldTextStyle(
                                    fontSize: AppSize.s25,
                                    color: AppColor.balck),
                              ),
                              Text(
                                AppStrings.dot,
                                style: getBoldTextStyle(
                                    fontSize: AppSize.s120,
                                    color: AppColor.primaryColorLight),
                              )
                            ],
                          ))
                    ])),
                const SizedBox(
                  height: AppSize.s18,
                ),
                Text(
                  AppStrings.registration,
                  style: getBoldTextStyle(
                      fontSize: AppSize.s20, color: AppColor.balck),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  AppStrings.addYourPhone,
                  textAlign: TextAlign.center,
                  style: getBoldTextStyle(
                    fontSize: AppSize.s14,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s38,
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p28),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Column(
                    children: [
                      IntlPhoneField(
                        pickerDialogStyle:
                            PickerDialogStyle(backgroundColor: AppColor.grey),
                        keyboardType: TextInputType.phone,
                        cursorColor: AppColor.primaryColor,
                        dropdownIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.primaryColor,
                        ),
                        style: const TextStyle(color: AppColor.primaryColor),
                        decoration: InputDecoration(
                          labelStyle: getRegularTextStyle(
                              fontSize: AppSize.s18,
                              color: AppColor.primaryColor),
                          suffixIcon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: AppSize.s30,
                          ),
                          enabled: true,
                          // label: Text("phone Number"),
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: AppColor.primaryColor)),
                        ),
                        initialCountryCode: "India",
                        onChanged: (phone) {
                          //when phone number country code is changed
                          print(phone.completeNumber); //get complete number
                          print(phone.countryCode); // get country code only
                          print(phone.number);
                          completeNumber = phone.completeNumber;
                          //controller.phoneNumberController.value = phone.completeNumber.toString() as TextEditingValue;// only phone number
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: true,
                        style: getRegularTextStyle(
                            fontSize: AppSize.s18,
                            color: AppColor.primaryColor),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColor.primaryColorLight,
                          ),
                          labelStyle: getRegularTextStyle(
                              fontSize: AppSize.s18,
                              color: AppColor.primaryColor),
                          suffixIcon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: AppSize.s30,
                          ),
                          enabled: true,
                          // label: Text("phone Number"),
                          hintText: "Email Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: AppColor.primaryColor)),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Obx(() => controller.isLoading.value ? const SizedBox(height: AppSize.s40, width: AppSize.s40,child: CircularProgressIndicator()) : SizedBox(
                          height: AppSize.s60,
                          width: double.infinity,
                          child: ElevatedButton(
                                  onPressed: () {
                                    //controller.phoneNumberController.text = completeNumber;
                                    controller.registerEmail();
                                    //Get.toNamed(Routes.otpScreen);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: const MaterialStatePropertyAll(
                                          AppColor.primaryColorLight),
                                      foregroundColor: const MaterialStatePropertyAll(
                                          AppColor.white),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppSize.s25)))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(AppPadding.p14),
                                    child: Text(AppStrings.send),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
