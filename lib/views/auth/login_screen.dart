import 'package:flutter/material.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/widget_common/bg_widget.dart';
import 'package:mart/widget_common/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
            10.heightBox
          ],
        ),
      ),
    ));
  }
}
