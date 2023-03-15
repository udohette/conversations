import 'package:conversations/presentation/clubs/clubs.dart';
import 'package:conversations/presentation/login/loginPage.dart';
import 'package:conversations/presentation/login_or_signup_screen/login_or_signup_screen.dart';
import 'package:conversations/presentation/otp/otp.dart';
import 'package:conversations/presentation/register/registerPage.dart';
import 'package:conversations/presentation/splash/splash_screen.dart';
import 'package:conversations/presentation/unknownPage.dart';
import 'package:conversations/resources/app_routes.dart';
import 'package:conversations/resources/app_strings.dart';
import 'package:conversations/utils/image_profile_user_reference.dart';
import 'package:conversations/utils/themes.dart';
import 'package:conversations/utils/user_preferences.dart';
import 'package:conversations/widgets/instagram_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreference.init();
  await ImageProfilePreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.zoom,
      //transitionDuration: const Duration(milliseconds: 1000),
      locale: const Locale(AppStrings.ENGLISH, AppStrings.FRENCH),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      //initialRoute: Routes.clubsRoute,
      title: AppStrings.appTitle,
      theme: appThemeData,
      darkTheme: darkThemeData,
      getPages: [
        GetPage(name: Routes.splashRoute, page: ()=>SplashScreen()),
        GetPage(name: Routes.loginOrRegister, page: ()=>LoginOrSignupScreen()),
        GetPage(transition: Transition.leftToRight, name: Routes.registerRoute, page: ()=>RegisterScreen()),
        GetPage(transition: Transition.leftToRight, name: Routes.loginRoute, page: ()=>LoginPage()),
        GetPage(transition: Transition.rightToLeft, name: Routes.otpScreen, page: ()=>OTPScreen()),
        GetPage(transition: Transition.rightToLeft, name: Routes.instagramPage, page: ()=>InstagramView()),
        GetPage(transition: Transition.rightToLeft, name: Routes.clubsRoute, page: ()=>Clubs()),
      ],
      unknownRoute: GetPage(name: Routes.unknownPage, page: ()=>const UnknownPage()),
      );
  }
}