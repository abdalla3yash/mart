import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:mart/services/firestore_service.dart';
import 'package:mart/views/chat/chat_screen.dart';
import 'package:mart/widget/loading_indecator.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title:
              'Messages'.text.color(darkFontGrey).fontFamily(semibold).make()),
      body: StreamBuilder(
        stream: FireStoreSercices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: LoadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
                child:
                    'No messages yet'.text.color(darkFontGrey).makeCentered());
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Get.to(() => const ChatScreen(), arguments: [
                                  data[index]['friend_name'],
                                  data[index]['toId']
                                ]);
                              },
                              leading: const CircleAvatar(
                                backgroundColor: redColor,
                                child: Icon(
                                  Icons.person,
                                  color: whiteColor,
                                ),
                              ),
                              title: '${data[index]['friend_name']}'
                                  .text
                                  .fontFamily(semibold)
                                  .size(25)
                                  .color(darkFontGrey)
                                  .make(),
                              subtitle: '${data[index]['last_msg']}'
                                  .text
                                  .size(17)
                                  .make(),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
