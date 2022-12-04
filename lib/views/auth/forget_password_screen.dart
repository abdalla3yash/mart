import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/views/auth/otp_screen.dart';
import 'package:mart/widget/widgets.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
            30.heightBox,
            Column(
              children: [
                customTextField(title: email, hint: emailHint),
                15.heightBox,
                customButton(
                    color: redColor,
                    textColor: whiteColor,
                    title: rememberPassword,
                    onpress: () {
                      Get.to(() => OTPScreen());
                    }).box.width(context.screenWidth - 200).make(),
                20.heightBox,
                forgetInstructions.text.color(fontGrey).make(),
                5.heightBox,
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
