// ignore_for_file: use_build_context_synchronously

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
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['image'] && controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['image'] && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
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
              10.heightBox,
              customTextField(
                controller: controller.oldPasswordController,
                hint: passwordHint,
                title: oldPass,
                isPass: true,
              ),
              10.heightBox,
              customTextField(
                controller: controller.oldPasswordController,
                hint: passwordHint,
                title: newPass,
                isPass: true,
              ),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: customButton(
                        color: redColor,
                        onpress: () async {
                          controller.isLoading(true);

                          if (controller.profileImgPath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }

                          if (data['password'] ==
                              controller.oldPasswordController.text) {
                            controller.changeAuthPassword(
                              email: data['email'],
                              password: controller.oldPasswordController.text,
                              newPassword:
                                  controller.newPasswordController.text,
                            );
                            await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password:
                                    controller.newPasswordController.text);
                            VxToast.show(context, msg: "Updated");
                          } else {
                            VxToast.show(context, msg: "Wrong Old Password");
                            controller.isLoading(false);
                          }
                        },
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
