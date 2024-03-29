import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/controllers/chat_controller.dart';
import 'package:mart/services/firestore_service.dart';
import 'package:mart/views/chat/components/message_bubble.dart';
import 'package:mart/widget/loading_indecator.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: '${controller.friendName}'
            .text
            .fontFamily(bold)
            .size(20)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: LoadingIndicator(),
                    )
                  : Expanded(
                      child: StreamBuilder(
                      stream: FireStoreSercices.getChatMessage(
                          controller.chatDocId.toString()),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: LoadingIndicator(),
                          );
                        } else if (snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: "Send a message..."
                                .text
                                .color(darkFontGrey)
                                .make(),
                          );
                        } else {
                          return ListView(
                            children: snapshot.data!.docs
                                .mapIndexed((currentValue, index) {
                              var data = snapshot.data!.docs[index];
                              return Align(
                                  alignment: data['uid'] == currentUser!.uid
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: MessageBubble(data));
                            }).toList(),
                          );
                        }
                      },
                    )),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.msgController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textfieldGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textfieldGrey),
                      ),
                      hintText: "Type a message..."),
                )),
                IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: redColor,
                    ))
              ],
            )
                .box
                .height(80)
                .padding(const EdgeInsets.all(12))
                .margin(const EdgeInsets.only(bottom: 8))
                .make(),
          ],
        ),
      ),
    );
  }
}
