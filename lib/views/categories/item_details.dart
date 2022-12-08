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
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
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
                    })
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
          )
        ],
      ),
    );
  }
}
