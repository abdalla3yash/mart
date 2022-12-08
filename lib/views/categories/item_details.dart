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
              child: Container(
            color: Colors.red,
          )),
          SizedBox(
            width: double.infinity,
            child: customButton(
                color: redColor, textColor: whiteColor, title: "Add to Card",onpress: (){}),
          )
        ],
      ),
    );
  }
}
