import 'dart:math';

import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_strings.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  late double? getLatitude;
  late double? getLongitude;

  @override
  void initState() {
_getUserLocation();
    super.initState();
  }

  Future<void> _getUserLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    setState(() {
      getLatitude = _locationData.latitude;
      getLongitude = _locationData.longitude;
      print("getLatitude $getLatitude");
      print("getLongitude $getLongitude");
    });
  }





  List<TextButton> clubButtons = [
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.church, color: Colors.deepOrange,), label: Text("Christianity", style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.gamepad_rounded), label: Text("Gaming",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.mosque), label: Text("Muslim",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.cruelty_free), label: Text("Comedy",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.heart, color: Colors.red,), label: Text("Love",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.music), label: Text("Music",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.movie,color: Colors.teal,), label: Text("Movies",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.book, color: Colors.green,), label: Text("Books",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.person, color: Colors.yellowAccent,), label: Text("Meet People",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Dating",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.family_restroom, color: Colors.purpleAccent,), label: Text("Social Isseus",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.church, color: Colors.deepOrange,), label: Text("Christianity", style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.gamepad_rounded), label: Text("Gaming",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.mosque), label: Text("Muslim",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.cruelty_free), label: Text("Comedy",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.heart, color: Colors.red,), label: Text("Love",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.music), label: Text("Music",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Christianity",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.book, color: Colors.green,), label: Text("Books",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.health_and_safety_outlined), label: Text("Health",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.family_restroom), label: Text("Relationship",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.family_restroom, color: Colors.purpleAccent,), label: Text("Social Isseus",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.music), label: Text("Music",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Christianity",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.book, color: Colors.green,), label: Text("Books",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.health_and_safety_outlined), label: Text("Health",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.family_restroom), label: Text("Relationship",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),)),
    TextButton.icon(onPressed: (){}, icon: Icon(Icons.family_restroom, color: Colors.purpleAccent,), label: Text("Social Isseus",style: getSemiBoldTextStyle(fontSize: AppSize.s16, color: AppColor.white),))
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, AppSize.s100, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topRight,
              height: AppSize.s38,
              child: Text('Skip',style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.primaryColorLight),),),
            SizedBox(height: AppSize.s20,),
            Text(AppStrings.clubMessageScreen1,style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.primaryColorLight),),
            SizedBox(height: AppSize.s20,),
            Text(AppStrings.clubMessageScreen2, textAlign: TextAlign.center,style: getLightTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColor,),),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: clubButtons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      mainAxisExtent: 50
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColor.primaryColorLight
                          ),
                            child: clubButtons[index]),
                      );
                    },
                  )),
            ),
            ElevatedButton(
              style: ButtonStyle(shape: MaterialStatePropertyAll(StadiumBorder())),
                onPressed: (){}, child: Text("Select 5",style: getRegularTextStyle(fontSize: AppSize.s16, color: AppColor.white),))
          ],
        ),
      ),
    );
  }
}