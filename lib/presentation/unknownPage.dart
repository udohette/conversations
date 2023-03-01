import 'package:conversations/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/app_strings.dart';
import '../resources/app_value_resource.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.noPageRouteFound),
      ),
      body: Center(child:  Text(AppStrings.noPageRouteFound, textAlign: TextAlign.center, style: getBoldTextStyle(fontSize: AppSize.s50, color: AppColor.primaryColorLight),)),
    );
  }
}
