// ignore_for_file: non_constant_identifier_names

import 'package:mart/consts/consts.dart';

Widget DetailsCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .padding(const EdgeInsets.all(4))
      .height(60)
      .make();
}
