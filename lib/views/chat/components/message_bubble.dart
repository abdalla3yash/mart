// ignore_for_file: non_constant_identifier_names

import 'package:mart/consts/consts.dart';

Widget MessageBubble() {
  return Container(
    margin: const EdgeInsets.only(bottom: 8.0),
    padding: const EdgeInsets.all(5),
    decoration: const BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
    child: Column(
      children: [
        "Message here...".text.white.size(16).make(),
        10.heightBox,
        "11:35 PM".text.color(whiteColor.withOpacity(0.5)).make()
      ],
    ),
  );
}
