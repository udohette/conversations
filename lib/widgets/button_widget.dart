import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/profile/editProfilePage.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({Key? key, required this.text, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.primaryColorLight),
          shape: MaterialStatePropertyAll(StadiumBorder()),
          overlayColor:  MaterialStatePropertyAll(AppColor.white),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: AppSize.s30, vertical: AppSize.s12)),
        ),
          onPressed: (){
              onClicked;
      },
          child: Text(text,)),
    );
  }
}
