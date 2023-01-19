import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/widget/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  "Total price"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  "40 \$".text.fontFamily(semibold).color(redColor).make(),
                ],
              )
                  .box
                  .padding(const EdgeInsets.all(12))
                  .color(lightGolden)
                  .roundedSM
                  .make(),
              SizedBox(
                width: context.screenWidth - 60,
                child: customButton(
                    color: redColor,
                    title: "Proceed To Shipping",
                    textColor: whiteColor,
                    onpress: () {
                      // Get.to();
                    }),
              )
            ],
          )),
    );
  }
}
