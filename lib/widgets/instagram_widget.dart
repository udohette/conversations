import 'dart:convert';
import 'package:conversations/constant/instagram_constant.dart';
import 'package:conversations/utils/globals.dart';
import 'package:conversations/widgets/build_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/isocia_network_model/instagram_mode.dart';


class InstagramView extends StatefulWidget {
  const InstagramView({Key? key}) : super(key: key);

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      final webview = FlutterWebviewPlugin();
      final InstagramModel instagram = InstagramModel();

      buildRedirectToHome(webview, instagram, context);

      return WebviewScaffold(
        url: InstagramConstant.instance.url,
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
      );
    });
  }

  Future<void> buildRedirectToHome(FlutterWebviewPlugin webview, InstagramModel instagram, BuildContext context) async {
    webview.onUrlChanged.listen((String url) async {
      if (url.contains(InstagramConstant.redirectUri)) {
        instagram.getAuthorizationCode(url);
        await instagram.getTokenAndUserID().then((isDone) {
          if (isDone) {
            instagram.getUserProfile().then((isDone) async {
              await webview.close();

              print('${instagram.username} logged in!');

              instagramName = instagram.username.toString();
              print('instagramName instagramName $instagramName');

              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString('userData', instagramName);

              /*SharedPreferences preferences = await SharedPreferences.getInstance();
              preferences.setString("instagramUsername", instagramName.toString());*/

              final String username = instagram.username.toString();
              var url = Uri.parse("http://instagram.com/_u/$username");
              WidgetsBinding.instance.addPostFrameCallback((_)async {
                await Get.to(_launchInBrowser(url));
              });

              // await Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => HomeView(
              //       token: instagram.authorizationCode.toString(),
              //       name: instagram.username.toString(),
              //     ),
              //   ),
              // );
            });
          }
        });
      }
    });
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class HomeView extends StatelessWidget {
  final String token;
  final String name;

  const HomeView({Key? key, required this.token, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome $name",)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Token $token"),
        ],
      ),
    );
  }
}

