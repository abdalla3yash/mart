import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/auth_controller.dart';
import 'package:mart/views/auth/login_screen.dart';
import 'package:mart/views/profile/components/details_cart.dart';
import 'package:mart/views/splach/splach_screen.dart';
import 'package:mart/widget/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 8),
              child: Align(
                  alignment: Alignment.topRight,
                  child: const Icon(
                    Icons.edit,
                    color: whiteColor,
                  ).onTap(() {})),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  5.heightBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "customer@example.com".text.white.make()
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor)),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(const LoginScreen());
                      },
                      child: "Logout".text.fontFamily(semibold).white.make())
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
                    count: "16",
                    title: "in your cart",
                    width: context.screenWidth / 3.4,
                  ),
                  DetailsCart(
                    count: "65",
                    title: "in your wishlist",
                    width: context.screenWidth / 3.4,
                  ),
                  DetailsCart(
                    count: "305",
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
      )),
    );
  }
}
