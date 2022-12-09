import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/auth_controller.dart';
import 'package:mart/views/auth/forget_password_screen.dart';
import 'package:mart/views/auth/signup_screen.dart';
import 'package:mart/views/home/Landing_screen.dart';
import 'package:mart/widget/bg_widget.dart';
import 'package:mart/widget/custom_btn.dart';
import 'package:mart/widget/custom_textField.dart';
import 'package:mart/widget/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    // text controllers
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
            30.heightBox,
            Column(
              children: [
                customTextField(
                    title: email,
                    hint: emailHint,
                    isPass: false,
                    controller: emailController),
                10.heightBox,
                customTextField(
                    title: password,
                    hint: passwordHint,
                    isPass: true,
                    controller: passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => const ForgetPassword());
                        },
                        child: forgetPassword.text.make())),
                customButton(
                    color: redColor,
                    textColor: whiteColor,
                    title: login,
                    onpress: () {
                      Get.to(() => const LandingScreen());
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                customButton(
                    color: lightGolden,
                    textColor: redColor,
                    title: signup,
                    onpress: () {
                      Get.to(() => const Signup());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                ),
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
