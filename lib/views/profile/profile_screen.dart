import 'package:mart/consts/consts.dart';
import 'package:mart/views/profile/components/details_cart.dart';
import 'package:mart/widget/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.edit,
                  color: whiteColor,
                ).onTap(() {})),
            Row(
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
                    onPressed: () {},
                    child: "Logout".text.fontFamily(semibold).white.make())
              ],
            ),
            20.heightBox,
            Row(
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
            )
          ],
        ),
      )),
    ));
  }
}
