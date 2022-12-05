import 'package:mart/consts/consts.dart';

Widget homeButtons(
    {double? width,
    double? height,
    String? icon,
    String? title,
    VoidCallback? onpress}) {
  return SizedBox(
    width: width,
    height: height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon!,
          width: 26,
        ),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.rounded.white.shadowSm.make(),
  );
}
