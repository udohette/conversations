
import 'package:conversations/presentation/login/loginPage.dart';
import 'package:conversations/presentation/login_or_signup_screen/login_or_signup_screen.dart';
import 'package:conversations/presentation/register/registerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/splash/splash_screen.dart';
import 'app_strings.dart';

class Routes{
  static const String splashRoute = "/splash";
  static const String onBoardingRoute = "/onbBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String otpScreen = "/otpScreen";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String clubsRoute = "/clubs";
  static const String instagramPage = "/instagramPage";
  static const String unknownPage = "/pageNotFound";
  static const String loginOrRegister = "/loginORegister";
}
// class RouteGenerator{
//   static Route<dynamic> getRoute(RouteSettings routeSettings){
//     switch(routeSettings.name){
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (context)=> const SplashScreen());
//
//       case Routes.loginOrRegister:
//         return MaterialPageRoute(builder: (context)=> const LoginOrSignupScreen());
//
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (context)=> const LoginPage());
//
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (context)=> const RegisterScreen());
//
//
//       default: return unDefinedRoute();
//     }
//   }
//
//   static Route<dynamic> unDefinedRoute(){
//     return MaterialPageRoute(builder: (context) => Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(AppStrings.noPageRouteFound),
//       ),
//       body: Center(child: const Text(AppStrings.noPageRouteFound)),
//     ));
//   }
//}
