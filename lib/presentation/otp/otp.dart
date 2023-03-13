import 'dart:async';

import 'package:conversations/presentation/otp/otp_controller.dart';
import 'package:conversations/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_styles.dart';
import '../../resources/app_value_resource.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  static const _timerDuration = 30;
  final StreamController _timerStream = StreamController<int>();
  late int timerCounter;
  late Timer _resendCodeTimer;
  OTPController controller = Get.put(OTPController());

  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;
  String message = '';
  String user_id = '';
  String errorMsg = '';
  bool _validate = false;

  @override
  void initState() {
    getMsg();
    activeCounter();
    super.initState();
  }

  @override
  void dispose() {
    _fieldOne.dispose();
    _fieldTwo.dispose();
    _fieldThree.dispose();
    _fieldFour.dispose();
    _fieldFive.dispose();
    _fieldSix.dispose();
    _timerStream.close();
    _resendCodeTimer.cancel();

    super.dispose();
  }

  activeCounter() {
    _resendCodeTimer =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          if (_timerDuration - timer.tick > 0)
            _timerStream.sink.add(_timerDuration - timer.tick);
          else {
            _timerStream.sink.add(0);
            _resendCodeTimer.cancel();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
                      color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: Stack(alignment: Alignment.center, children: [
                    Center(
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
                                  fontSize: AppSize.s25, color: AppColor.balck),
                            ),
                            Text(
                              AppStrings.dot,
                              style: getBoldTextStyle(
                                  fontSize: AppSize.s120,
                                  color: AppColor.primaryColorLight),
                            )
                          ],
                        ))
                  ]),
                ),
                SizedBox(
                  height: AppSize.s18,
                ),
                Text(
                  AppStrings.verification,
                  style: getBoldTextStyle(
                      fontSize: AppSize.s20, color: AppColor.balck),
                ),
                SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  message.toString(),
                  textAlign: TextAlign.center,
                  style: getBoldTextStyle(
                    fontSize: AppSize.s14,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: AppSize.s38,
                ),
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
                          OTPInput(controller: _fieldOne, autoFocus: true),
                          SizedBox(
                            width: 4,
                          ), // auto focus
                          OTPInput(controller: _fieldTwo, autoFocus: false),
                          SizedBox(
                            width: 4,
                          ),
                          OTPInput(controller: _fieldThree, autoFocus: false),
                          SizedBox(
                            width: 4,
                          ),
                          OTPInput(controller: _fieldFour, autoFocus: false),
                          SizedBox(
                            width: 4,
                          ),
                          OTPInput(controller: _fieldFive, autoFocus: false),
                          SizedBox(
                            width: 4,
                          ),
                          OTPInput(controller: _fieldSix, autoFocus: false),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_fieldOne.text.isNotEmpty &&
                                  _fieldTwo.text.isNotEmpty &&
                                  _fieldThree.text.isNotEmpty &&
                                  _fieldFour.text.isNotEmpty &&
                                  _fieldFive.text.isNotEmpty &&
                                  _fieldSix.text.isNotEmpty) {
                                controller.otpVerification();
                              } else {
                                Get.snackbar(
                                    'Empty Box', 'Please fill the all fields');
                              }

                              setState(() {
                                errorMsg.toString();
                                controller.user_id = user_id.toString();
                                controller.v_code.text = _fieldOne.text +
                                    _fieldTwo.text +
                                    _fieldThree.text +
                                    _fieldFour.text +
                                    _fieldFive.text +
                                    _fieldSix.text;
                                print(
                                    "Printing V_Code ${controller.v_code
                                        .text}");
                                print(
                                    "Printing V_Code ${controller.v_code
                                        .text}");
                                print(
                                    "Printing V_Code ${controller.v_code
                                        .text}");
                                print(
                                    "Printing user_id ${controller.user_id
                                        .toString()}");
                              });
                              // controller.v_code.text = _otp.toString();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColor.primaryColorLight),
                                foregroundColor:
                                MaterialStatePropertyAll(AppColor.white),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppSize.s25)))),
                            child: const Padding(
                              padding: EdgeInsets.all(AppPadding.p14),
                              child: Text(AppStrings.verify),
                            )),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Obx(
                            () =>
                            Text(
                              controller.controllerText.value.toString(),
                              style: getBoldTextStyle(
                                  fontSize: AppSize.s14, color: AppColor.red),
                            ),
                      ),
                      //deisplay the entered otp
                      // Text(_otp ?? "Enter Text", style: TextStyle(fontSize: 30),),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  "Didn't your receive any code?",
                  style: getBoldTextStyle(
                      fontSize: AppSize.s14, color: Colors.black38),
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
                StreamBuilder(
                  stream: _timerStream.stream,
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    return SizedBox(
                      //width: 300,
                      child: TextButton(
                        //textColor: Theme.of(context).accentColor,
                          onPressed: snapshot.data == 0
                              ? () {
                            _timerStream.sink.add(30);
                            activeCounter();
                          }
                              : null,
                          //textColor: Theme.of(context).accentColor,
                          child: Center(
                              child: snapshot.data == 0
                                  ?
                              Text(
                                "Resend Code",
                                style: getBoldTextStyle(
                                    fontSize: AppSize.s18,
                                    color: AppColor.primaryColor),
                              )
                                  : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                          Text(
                          'Resend code after ${snapshot.hasData ?
                              snapshot.data.toString() : 30} seconds '),
                      ],
                    )),
                    ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }

  Future getMsg() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      message = _prefs.getString("message").toString();
      user_id = _prefs.getString('user_id').toString();
      errorMsg = _prefs.getString("errorMsg").toString();
    });
  }

  _textfieldOTP({required bool first, last}) {
    String texteEntered = "";
    return Expanded(
      child: Container(
        height: AppSize.s70,
        child: AspectRatio(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  texteEntered = value;
                  if (value.length == 1 && last == false) {
                    FocusScope.of(context).nextFocus();
                    texteEntered = value.toString();
                  }
                  if (value.length == 0 && first == false) {
                    FocusScope.of(context).previousFocus();
                  }
                });
                print("texteEntered textEntered $texteEntered");
                print("texteEntered textEntered $texteEntered");
              },
              showCursor: false,
              readOnly: false,
              textAlign: TextAlign.center,
              style: getBoldTextStyle(
                  fontSize: AppSize.s25, color: AppColor.balck),
              keyboardType: TextInputType.text,
              maxLength: 1,
              decoration: InputDecoration(
                counter: Offstage(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black12),
                    borderRadius: BorderRadius.circular(AppSize.s12)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(AppSize.s12)),
              ),
            ),
            aspectRatio: 0.7),
      ),
    );
  }
}
