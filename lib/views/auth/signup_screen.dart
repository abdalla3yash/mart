import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/auth_controller.dart';
import 'package:mart/views/home/Landing_screen.dart';
import 'package:mart/widget/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var controller = Get.put(AuthController());
  bool? isCheck = false;

  // text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
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
                customTextField(
                    title: name,
                    hint: nameHint,
                    controller: nameController,
                    isPass: false),
                10.heightBox,
                customTextField(
                    title: email,
                    hint: emailHint,
                    controller: emailController,
                    isPass: false),
                10.heightBox,
                customTextField(
                    title: password,
                    hint: passwordHint,
                    controller: passwordController,
                    isPass: true),
                10.heightBox,
                customTextField(
                    title: retypePassword,
                    hint: passwordHint,
                    controller: passwordRetypeController,
                    isPass: true),
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
                    onpress: () async {
                      if (isCheck != false) {
                        try {
                          await controller
                              .signupMethod(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            return controller.storeUserData(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text);
                          }).then((value) {
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(() => const LandingScreen());
                          });
                        } catch (e) {
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                        }
                      }
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
