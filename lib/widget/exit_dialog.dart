import 'package:flutter/services.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/widget/custom_btn.dart';

Widget ExitDialog(context) {
  return Dialog(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
      const Divider(),
      10.heightBox,
      "Are you sure you want to exit?".text.size(16).color(darkFontGrey).make(),
      10.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customButton(
            color: redColor,
            onpress: () {
              SystemNavigator.pop();
            },
            textColor: whiteColor,
            title: "Yes",
          ),
          customButton(
            color: redColor,
            onpress: () {
              Navigator.pop(context);
            },
            textColor: whiteColor,
            title: "No",
          ),
        ],
      ),
    ],
  ).box.color(lightGrey).padding(const EdgeInsets.all(10)).rounded.make());
}
