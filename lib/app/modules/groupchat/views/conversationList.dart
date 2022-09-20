// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emeraldchat_mobile/app/data/models/conversationModel.dart';
import 'package:emeraldchat_mobile/app/modules/groupchat/views/conversation_view.dart';
import 'package:flutter/material.dart';
import 'package:emeraldchat_mobile/app/data/models/chatMessageModel.dart';
import 'package:get/get.dart';

import '../controllers/groupchat_controller.dart';

class ConversationList extends GetView<GroupchatController> {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList({Key? key, required this.name,required this.messageText,required this.imageUrl,required this.time,required this.isMessageRead}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ConversationView());
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style: TextStyle(color:Colors.white,fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(time,style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
