import 'package:conversations/resources/app_value_resource.dart';
import 'package:conversations/widgets/build_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/user_preferences.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/profile_widgets.dart';
import '../../widgets/textFieldWidgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreference.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
        ProfileWidgets(
        imagePath: user.imagePath,
        onClicked: (){}, isEdit: true,),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "Full Name",
            text: user.name,
            onChanged: (name){},
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            label: "Email",
            text: user.email,
            onChanged: (email){},
          ),
          SizedBox(height: AppSize.s25,),
          TextFieldWidget(
            maxLines: 5,
            label: "About Me",
            text: user.about,
            onChanged: (about){},
          ),
          SizedBox(height: AppSize.s25,),
          buildUpgradeButton(),
        ]),
    );
  }
  Widget buildUpgradeButton(){
    return ButtonWidget(
        text: "Save",
        onClicked: (){
        });
  }
}
