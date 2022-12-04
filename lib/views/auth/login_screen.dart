import 'package:flutter/material.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/widget_common/bg_widget.dart';
import 'package:mart/widget_common/custom_btn.dart';
import 'package:mart/widget_common/custom_textField.dart';
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
            10.heightBox,
            Column(
              children: [
                customTextField(title: email, hint: emailHint),
                10.heightBox,
                customTextField(title: password, hint: passwordHint),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make())),
                customButton(
                        pcolor: redColor,
                        textColor: whiteColor,
                        title: login,
                        onpress: () {})
                    .box
                    .width(context.screenWidth - 50)
                    .make()
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenHeight - 70)
                .make(),
          ],
        ),
      ),
    ));
  }
}
