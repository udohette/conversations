import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/app_value_resource.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({Key? key, required this.controller, required this.autoFocus}) : super(key: key);
  final TextEditingController controller;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSize.s70,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: TextField(
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            controller: controller,
            maxLength: 1,
            showCursor: false,
            cursorColor: Theme.of(context).primaryColor,
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
            onChanged: (value) {
              if(value.isEmpty){
                return;
              }
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
  String? get _errorText{
    final text = controller.value.text;
    if(text.isEmpty){
      return 'Can\'t be empty';
    }
    if(text.length < 1){
      return 'please input Verification code';
    }
    return null;
  }
}
