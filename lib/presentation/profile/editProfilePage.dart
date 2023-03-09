import 'dart:io';

import 'package:conversations/model/profile_image.dart';
import 'package:conversations/model/userProfileData.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:conversations/utils/image_profile_user_reference.dart';
import 'package:conversations/widgets/build_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/user_preferences.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/profile_widgets.dart';
import '../../widgets/textFieldWidgets.dart';
import 'package:path/path.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserProfile user;
  late ProfileImage profileImg;

  @override
  void initState() {
    super.initState();
     user = UserPreference.getUser();
     profileImg = ImageProfilePreference.getProfileImg();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
        ProfileWidgets(
        imagePath: profileImg.imagePath,
        onClicked: ()async{
          final image = await ImagePicker().getImage(source: ImageSource.gallery);
          if(image == null){
            return;
          }else{
            final directory = await getApplicationDocumentsDirectory();
            final name = basename(image.path);
            final imageFile = File('${directory.path}/$name');
            final newImage = await File(image.path).copy(imageFile.path);
            setState(() {
              profileImg = profileImg.copy(imagePath: newImage.path);
              print({"Get Image Location and Name: $imageFile"});
              print({"Image Path: $name"});
              print({"Image Location: $newImage"});
              print({"Image Location: $newImage"});
              print({"Image Location: $newImage"});
            });
          }
          print("Hello Testing Call Back");

        }, isEdit: true,),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "First Name",
            text: user.fName,
            onChanged: (name)=> user = user.copyWith(fName: name),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "Last Name",
            text: user.lName,
            onChanged: (name)=> user = user.copyWith(lName: name),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "Occupation",
            text: user.occupation,
            onChanged: (occupation)=> user = user.copyWith(occupation: occupation),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "DOB",
            text: user.dob,
            onChanged: (dob)=> user = user.copyWith(dob: dob),
          ),
          TextFieldWidget(
            label: "Gender",
            text: user.gender,
            onChanged: (gender)=> user = user.copyWith(gender: gender),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            maxLines: 5,
            label: "About Me",
            text: user.about,
            onChanged: (about)=> user = user.copyWith(about: about),
          ),
          SizedBox(height: AppSize.s25,),
          gradeButton(),
        ]),
    );
  }
  Widget gradeButton(){
    return ButtonWidget(
        text: 'Save',
        onClicked: () {
          UserPreference.setUser(user);
          ImageProfilePreference.setProfileImg(profileImg);
          Navigator.of(this.context).pop();
        },
    );
  }
}
