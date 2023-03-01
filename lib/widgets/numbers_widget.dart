import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(context, "5.8", "Ranking"),
          buildDivider(),
          buildButton(context, "25", "Following"),
          buildDivider(),
          buildButton(context, "50", "Followers"),

        ],
      ),
    );
  }
  Widget buildDivider(){
    return Container(
      height: AppSize.s25,
        child: VerticalDivider());
  }
 Widget buildButton(BuildContext context, String value, String text){
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {  },
      child: Column(
        mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(value, style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.balck),),
          SizedBox(height: 2,),
          Text(text, style: getBoldTextStyle(fontSize: AppSize.s18, color: AppColor.balck),)
      ],

      ),
    );

  }
}
