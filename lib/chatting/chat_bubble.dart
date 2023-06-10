import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class chatbubbles extends StatelessWidget {
  const chatbubbles(this.message,this.isMe ,{Key? key}) : super(key: key);

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isMe ?
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          backGroundColor: Colors.blue,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ) :
      Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
          backGroundColor: Color(0xffE7E7ED),
          margin: EdgeInsets.only(top: 20),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      )
    );
  }
}
