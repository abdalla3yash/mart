import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/auth_controller.dart';
import 'package:mart/controllers/profile_controller.dart';
import 'package:mart/services/firestore_service.dart';
import 'package:mart/views/auth/login_screen.dart';
import 'package:mart/views/profile/components/details_cart.dart';
import 'package:mart/views/profile/components/edit_profile_screen.dart';
import 'package:mart/widget/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
        stream: FireStoreSercices.getUser(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, top: 8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.edit,
                        color: whiteColor,
                      ).onTap(
                        () {
                          controller.nameController.text = data['name'];
                          Get.to(
                            () => EditProfileScreen(
                              data: data,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                imgProfile,
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            "${data['email']}".text.white.make()
                          ],
                        )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: whiteColor)),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(const LoginScreen());
                            },
                            child:
                                "Logout".text.fontFamily(semibold).white.make())
                      ],
                    ),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsCart(
                          count: "${data['cart_count']}",
                          title: "in your cart",
                          width: context.screenWidth / 3.4,
                        ),
                        DetailsCart(
                          count: "${data['wishlist_count']}",
                          title: "in your wishlist",
                          width: context.screenWidth / 3.4,
                        ),
                        DetailsCart(
                          count: "${data['order_count']}",
                          title: "you ordered",
                          width: context.screenWidth / 3.4,
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonList.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 22,
                        ),
                        title: profileButtonList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                  )
                      .box
                      .white
                      .rounded
                      .margin(const EdgeInsets.all(12))
                      .padding(
                        const EdgeInsets.symmetric(horizontal: 16),
                      )
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make()
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
