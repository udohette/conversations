import 'package:conversations/presentation/profile/editProfilePage.dart';
import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_value_resource.dart';
import 'package:flutter/material.dart';

class ProfileWidgets extends StatelessWidget {
  final bool isEdit;
  final String imagePath;
  final VoidCallback onClicked;
  const ProfileWidgets({Key? key, required this.imagePath, required this.onClicked, required this.isEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
          children: [
            buildImage(context),
            Positioned(
              bottom: 0,
                right: 4,
                child: buildEditButton(color))
          ]),
    );
  }
  Widget buildImage(BuildContext context){
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
            image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: () {
            onClicked;
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditProfilePage()));
            print("Print me ");
            print("Print me ");
            print("Print me ");
            print("Print me ");
          },),
        ),
      ),
    );
  }
  buildEditButton(Color color){
    return buildCircle(
        child: buildCircle(
            child: isEdit == false? Icon(Icons.edit, color: AppColor.white,size: AppSize.s20,):Icon(Icons.camera_alt, color: AppColor.white,size: AppSize.s20,),
            color: AppColor.blue,
            all: AppSize.s8),
        color: AppColor.white,
        all: AppPadding.p3);


  }
  buildCircle({required Widget child, required Color color, required double all}){
    return ClipOval(
      child: Container(
        child: child,
        color: color,
        padding: EdgeInsets.all(all),
      ),
    );

  }
}
