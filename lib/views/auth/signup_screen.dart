import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/views/home/Landing_screen.dart';
import 'package:mart/widget/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? isCheck = false;
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
                customTextField(title: name, hint: nameHint),
                10.heightBox,
                customTextField(title: email, hint: emailHint),
                10.heightBox,
                customTextField(title: password, hint: passwordHint),
                10.heightBox,
                customTextField(title: retypePassword, hint: passwordHint),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: terms,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            ),
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                10.heightBox,
                customButton(
                    color: isCheck == true ? redColor : lightGolden,
                    textColor: whiteColor,
                    title: signup,
                    onpress: () {
                      Get.to(() => LandingScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: haveAccount,
                          style: TextStyle(fontFamily: bold, color: fontGrey)),
                      TextSpan(
                          text: login,
                          style: TextStyle(fontFamily: bold, color: redColor)),
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                })
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
