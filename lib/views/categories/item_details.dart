import 'package:mart/consts/consts.dart';
import 'package:mart/widget/custom_btn.dart';

class ItemDetailsScreen extends StatelessWidget {
  String? title;
  ItemDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imgFc1,
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
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  stepInt: true,
                ),
                10.heightBox,
                "\$30.00".text.color(redColor).fontFamily(bold).size(18).make(),
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
                        "Revin"
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
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(
                              5,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                            ),
                            "0".text.size(16).color(darkFontGrey).make(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                            10.widthBox,
                            "0 available"
                                .text
                                .size(16)
                                .color(darkFontGrey)
                                .make(),
                          ],
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
                        "\$0.00"
                            .text
                            .size(16)
                            .color(redColor)
                            .fontFamily(bold)
                            .make(),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadow.make(),

                // description Section

                10.heightBox,
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "This is a dummy data and dummy item description here ..."
                    .text
                    .color(darkFontGrey)
                    .make(),
                10.heightBox,
                ListView(
                  shrinkWrap: true,
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
                )
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
