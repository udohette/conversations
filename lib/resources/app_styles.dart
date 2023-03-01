import 'dart:ui';

import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/cupertino.dart';

import 'app_fonts.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight,Color color,){
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);

}
//Regular style
TextStyle getRegularTextStyle({@required double fontSize = AppSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, AppFontWeight.regular, color);
}
//Light style
TextStyle getLightTextStyle({@required double fontSize = AppSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, AppFontWeight.light, color);
}
//Medium style
TextStyle getMediumTextStyle({@required double fontSize = AppSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, AppFontWeight.medium, color);
}
//Semi Bold style
TextStyle getSemiBoldTextStyle({@required double fontSize = AppSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, AppFontWeight.semiBold, color);
}
//Bold style
TextStyle getBoldTextStyle({@required double fontSize = AppSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, AppFontWeight.bold, color);
}