// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emeraldchat_mobile/app/data/models/chatMessageModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/videochat_controller.dart';

class VideochatView extends GetView<VideochatController> {
   List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Bro", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "No, I`m fine", messageType: "receiver"),    
  ];
  VideochatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text(
      'Navigation Drawer',
    ),
     backgroundColor: Colors.blueGrey.shade600,
  ),
  endDrawer: Drawer(
    child: Stack(      
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[                                       
             ListView.builder(                                        
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(             
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade100:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                 },
                ),
                                      
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10,right: 20),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                
                  SizedBox(width: 15,),
                  Expanded(                  
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(                                                                                  
                    onPressed: (){},
                    backgroundColor: Colors.blueGrey.shade600,
                    elevation: 0,
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
  ),
  body: Center(
    child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
      ],
    ),
  ),
);
  }
}
