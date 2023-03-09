import 'package:conversations/presentation/homePage/homaPage.dart';
import 'package:conversations/presentation/profile/profilePage.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: AppSize.s50,
        buttonBackgroundColor: AppColor.white,
        color: AppColor.primaryColor,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
          backgroundColor: AppColor.white,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: const Duration(milliseconds: 400),
          items: [
            Icon(Icons.home, color: activeIndex == 0 ? AppColor.greyDark : AppColor.white, size: AppSize.s30),
            Icon(Icons.person, color: activeIndex == 1 ? AppColor.greyDark : AppColor.white, size: AppSize.s30,),
          ]),
      body: pages.elementAt(activeIndex),
    );
  }
}
