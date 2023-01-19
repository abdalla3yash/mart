import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/cart_controller.dart';
import 'package:mart/services/firestore_service.dart';
import 'package:mart/widget/loading_indecator.dart';
import 'package:mart/widget/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
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
        body: StreamBuilder(
          stream: FireStoreSercices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: LoadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "Cart is empty".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculateCartedAllProductPrice(data: data);
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"),
                                title:
                                    "${data[index]['title']} (x${data[index]['qty']}) "
                                        .text
                                        .fontFamily(semibold)
                                        .size(16)
                                        .make(),
                                subtitle: "${data[index]['tprice']}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .make(),
                                trailing:
                                    const Icon(Icons.delete, color: redColor)
                                        .onTap(() {
                                  FireStoreSercices.deleteCartItem(
                                      data[index].id);
                                }),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          "Total price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          Obx(
                            () => "${controller.cartTotalPrice.value} \$"
                                .text
                                .fontFamily(semibold)
                                .color(redColor)
                                .make(),
                          ),
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
                  ));
            }
          },
        ));
  }
}
