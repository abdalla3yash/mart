import 'dart:io';

import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/profile_controller.dart';
import 'package:mart/widget/widgets.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    controller.nameController.text = data['name'];
    controller.passwordController.text = data['password'];
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButton(
                  color: redColor,
                  onpress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              customTextField(
                controller: controller.passwordController,
                hint: passwordHint,
                title: password,
                isPass: true,
              ),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child: customButton(
                  color: redColor,
                  onpress: () {},
                  textColor: whiteColor,
                  title: "Save",
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
