import 'dart:io';

import 'package:conversations/model/userProfileData.dart';
import 'package:conversations/resources/app_value_resource.dart';
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

  @override
  void initState() {
    super.initState();
     user = UserPreference.getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
        ProfileWidgets(
        imagePath: user.imagePath,
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
              user = user.copy(imagePath: newImage.path);
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
            label: "Full Name",
            text: user.name,
            onChanged: (name)=> user = user.copy(name: name),
          ),

          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "Email",
            text: user.email,
            onChanged: (email) => user = user.copy(email: email),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "phone Number",
            text: user.phone,
            onChanged: (phone)=>user = user.copy(phone: phone),
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            maxLines: 5,
            label: "About Me",
            text: user.about,
            onChanged: (about)=> user = user.copy(about: about),
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
          Navigator.of(this.context).pop();
        },
    );
  }
}
