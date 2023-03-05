import 'package:conversations/model/userProfileData.dart';
import 'package:conversations/presentation/profile/editProfilePage.dart';
import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:conversations/utils/user_preferences.dart';
import 'package:conversations/widgets/button_widget.dart';
import 'package:conversations/widgets/numbers_widget.dart';
import 'package:conversations/widgets/profile_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../../widgets/build_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreference.getUser();
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidgets(
          onClicked: ()async{
            print("Hello Open");
            print("Hello Open");
            print("Hello Open");
            print("Hello Open");
            await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProfilePage()));
            setState(() {});},
            isEdit: false,
            imagePath: user.imagePath,

          ),
          SizedBox(height: AppSize.s10,),
          buildName(user),
          buildSocialMedia(),
          buildStatus(user),
          buildUpgradeButton(),
          SizedBox(height: AppSize.s10,),
          const NumbersWidget(),
          SizedBox(height: AppSize.s10,),
          buildFavoriteClubs(),
          SizedBox(height: AppSize.s20,),
          //buildFavoriteRooms(),
          SizedBox(height: AppSize.s16,),
          buildAbout(user)
        ],
      ),
    );
  }
  Widget buildStatus(UserProfile user){
    return Container(
      width: 10,
      decoration: BoxDecoration(
        shape:BoxShape.rectangle,

      ),
      padding: EdgeInsets.all(AppPadding.p14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Unverified", style: getBoldTextStyle(fontSize: AppSize.s20, color: Colors.grey.shade700),),
          Icon(Icons.check_circle, color: Colors.yellow.shade700,)
        ],
      ),
    );
  }
  Widget buildName(UserProfile user){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text(user.name, style: getBoldTextStyle(fontSize: AppSize.s20, color: AppColor.balck),),
        SizedBox(height: AppSize.s4,),
        Text(user.email, style: getBoldTextStyle(fontSize: AppSize.s16, color: Colors.grey),),
        SizedBox(height: AppSize.s4,),
        Text(user.phone, style: getBoldTextStyle(fontSize: AppSize.s16, color: Colors.grey),)
    ],);
  }
  Widget buildUpgradeButton(){
    return ButtonWidget(
        text: "Upgrade to Pro",
        onClicked: (){
        });
  }
  Widget buildSocialMedia(){
    return  Row(
      children: [
        IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.blue,)),
        IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.purpleAccent,))
      ],
    );
  }
  Widget buildAbout(UserProfile user){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.primaryColorLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("About Me", style: getBoldTextStyle(fontSize: AppSize.s25, color: Colors.grey),),
            SizedBox(height: AppSize.s16,),
            Text(user.about,  style: getRegularTextStyle(fontSize: AppSize.s18, color: Colors.grey,),)

          ],
        ),
      ),
    );

  }
  Widget buildFavoriteClubs(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("clubs", style: getMediumTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColorLight),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
                onPressed: (){}, icon: Icon(Icons.headphones, color: AppColor.primaryColorLight,), label: Text("MUSIC")),
            TextButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
                onPressed: (){}, icon: Icon(Icons.fitness_center, color: AppColor.primaryColorLight,), label: Text("FITNESS")),
            TextButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
                onPressed: (){}, icon: Icon(Icons.cake_outlined, color: AppColor.primaryColorLight,), label: Text("FOOD & DRINKS")),
          ],),
        ]),
    );

  }
  // Widget buildFavoriteRooms(){
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: AppPadding.p14),
  //     child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text("rooms", style: getMediumTextStyle(fontSize: AppSize.s18, color: AppColor.primaryColorLight),),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               TextButton(
  //                   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
  //                   onPressed: (){},  child: Text("CALL"),),
  //               SizedBox(width: AppSize.s8,),
  //               TextButton(
  //                   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
  //                   onPressed: (){}, child: Text("CAR"),),
  //               SizedBox(width: AppSize.s8,),
  //               TextButton(
  //                   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.grey)),
  //                   onPressed: (){},child: Text("TELEGRAM"),),
  //             ],),
  //         ]),
  //   );
  //
  // }

}
