// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mart/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

Widget MessageBubble(DocumentSnapshot data) {
  var date =
      data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(date);
  return Directionality(
    textDirection:
        data['uid'] == currentUser!.uid ? TextDirection.ltr : TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: data['uid'] == currentUser!.uid ? senderColor : reciverColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        children: [
          "${data['msg']}".text.white.size(16).make(),
          10.heightBox,
          time.text.color(whiteColor.withOpacity(0.5)).make()
        ],
      ),
    ),
  );
}
