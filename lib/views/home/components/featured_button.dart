import 'package:mart/consts/consts.dart';

Widget featuredButton({String? title, String? icon}) {
  return Row(
    children: [
      Image.asset(
        icon!,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .white
      .padding(const EdgeInsets.all(8))
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .outerShadowSm
      .make();
}
