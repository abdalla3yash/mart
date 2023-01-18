// ignore_for_file: must_be_immutable

import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/product_controller.dart';
import 'package:mart/widget/custom_btn.dart';

class ItemDetailsScreen extends StatelessWidget {
  String? title;
  final dynamic data;
  ItemDetailsScreen({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          ]),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    aspectRatio: 16 / 9,
                    itemCount: data['p_imgs'].length,
                    viewportFraction: 1.0,
                    itemBuilder: (context, index) {
                      return Image.network(
                        data['p_imgs'][index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }),
                10.heightBox,
                title!.text
                    .size(16)
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                VxRating(
                  isSelectable: false,
                  value: double.parse(data['p_rating']),
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  maxRating: 5,
                ),
                10.heightBox,
                "\$ ${data['p_price']}"
                    .text
                    .color(redColor)
                    .fontFamily(bold)
                    .size(18)
                    .make(),
                10.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.white.fontFamily(semibold).make(),
                        5.heightBox,
                        "${data['p_seller']}"
                            .text
                            .white
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .size(16)
                            .make(),
                      ],
                    )),
                    const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        Icons.message,
                        color: darkFontGrey,
                      ),
                    )
                  ],
                )
                    .box
                    .height(60)
                    .padding(const EdgeInsets.symmetric(horizontal: 12))
                    .color(textfieldGrey)
                    .make(),

                // color section
                20.heightBox,
                Obx(
                  () => Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                data['p_colors'].length,
                                (index) => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VxBox()
                                            .size(40, 40)
                                            .roundedFull
                                            .color(
                                                Color(data['p_colors'][index])
                                                    .withOpacity(1.0))
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .make()
                                            .onTap(() {
                                          controller.changeColorIndex(index);
                                        }),
                                        Visibility(
                                          visible: index ==
                                              controller.colorIndex.value,
                                          child: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      // Quantity Section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity".text.color(textfieldGrey).make(),
                          ),
                          Obx(
                            () => Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.decreaseQuentity();
                                    controller.calculateTotalPrice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                controller.quentity.value.text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                                IconButton(
                                  onPressed: () {
                                    controller.increaseQuentity(
                                        int.parse(data['p_quentity']));
                                    controller.calculateTotalPrice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                10.widthBox,
                                "(${data['p_quentity']} available)"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                      // total price Section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total".text.color(textfieldGrey).make(),
                          ),
                          "\$${controller.totalPrice.value}"
                              .text
                              .size(16)
                              .color(redColor)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadow.make(),
                ),

                // description Section

                10.heightBox,
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "${data['p_desc']}".text.color(darkFontGrey).make(),
                10.heightBox,
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      itemDetailsButtonList.length,
                      (index) => ListTile(
                            title: itemDetailsButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(Icons.arrow_forward_sharp),
                          )),
                ),
                20.heightBox,
                productsyoumayLike.text
                    .fontFamily(bold)
                    .size(16)
                    .color(darkFontGrey)
                    .make(),

                20.heightBox,

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Laptop 4GB/64GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .roundedSM
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .padding(const EdgeInsets.all(8))
                                .make()),
                  ),
                ),
              ],
            )),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: customButton(
                color: redColor,
                textColor: whiteColor,
                title: "Add to Card",
                onpress: () {}),
          ),
        ],
      ),
    );
  }
}
