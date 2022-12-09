import 'package:mart/consts/consts.dart';
import 'package:mart/widget/bg_widget.dart';
import 'package:mart/widget/widgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            imgProfile,
            width: 100,
            fit: BoxFit.cover,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          customButton(
              color: redColor,
              onpress: () {},
              textColor: whiteColor,
              title: "Change"),
          const Divider(),
          20.heightBox,
          customTextField(
            hint: nameHint,
            title: name,
            isPass: false,
          ),
          customTextField(
            hint: passwordHint,
            title: password,
            isPass: true,
          ),
          20.heightBox,
          SizedBox(
            width: context.screenWidth - 60,
            child: customButton(
                color: redColor,
                onpress: () {},
                textColor: whiteColor,
                title: "Save"),
          ),
        ])
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    );
  }
}
