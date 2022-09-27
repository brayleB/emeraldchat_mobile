// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:emeraldchat_mobile/app/data/models/chatMessageModel.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/views/postchat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../bindings/textchat_binding.dart';
import '../controllers/textchat_controller.dart';


class TextchatView extends GetView<TextchatController> {
  final storeController = Get.put(TextchatController());
  final txtController = Get.find<TextchatController>();
  TextchatView({Key? key}) : super(key: key);
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Bro", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "No, I`m fine", messageType: "receiver"),    
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey.shade600,        
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Silver Seatra",style: TextStyle(color: Colors.white, fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                    ],
                  ),
                ),           
              ],
            ),
          ),
        ),
      ),
      body: Stack(      
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
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>PostchatView());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade600,
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25)),
                      ),
                      child: Text("Stop",style: TextStyle(color: Colors.white, fontSize: 13),),
                    ),
                  ),
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
    );
  }
}
