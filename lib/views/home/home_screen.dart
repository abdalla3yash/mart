import 'package:mart/consts/consts.dart';
import 'package:mart/widget/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: search,
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),
          VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Image.asset(
                  sliderList[index],
                  fit: BoxFit.cover,
                )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make());
              }),
          10.heightBox,
          Row(
            children: List.generate(
                2,
                (index) => homeButtons(
                      height: context.screenHeight * 0.2,
                      width: context.screenWidth / 2.5,
                      title: index == 0 ? todayDeal : flashSale,
                      icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    )),
          )
        ],
      )),
    );
  }
}
