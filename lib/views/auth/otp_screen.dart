import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/views/auth/login_screen.dart';

import '../../widget/widgets.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(22).make(),
            10.heightBox,
            "Type Ypur Verification Code Here"
                .text
                .fontFamily(semibold)
                .white
                .size(16)
                .make(),
            30.heightBox,
            Column(
              children: [
                customTextField(
                    title: otp, hint: otpHint, controller: controller),
                15.heightBox,
                customButton(
                    color: controller.text.isEmpty ? lightGolden : redColor,
                    textColor: whiteColor,
                    title: start,
                    onpress: () {
                      controller.text.isEmpty
                          ? {}
                          : Get.to(() => const LoginScreen());
                    }).box.width(context.screenWidth - 200).make(),
                10.heightBox,
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenHeight - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
