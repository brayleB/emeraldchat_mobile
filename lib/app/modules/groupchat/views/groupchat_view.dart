// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emeraldchat_mobile/app/data/models/conversationModel.dart';
import 'package:emeraldchat_mobile/app/modules/groupchat/views/conversationList.dart';
import 'package:flutter/material.dart';
import 'package:emeraldchat_mobile/app/data/models/chatMessageModel.dart';
import 'package:get/get.dart';

import '../controllers/groupchat_controller.dart';

class GroupchatView extends GetView<GroupchatController> {
  GroupchatView({Key? key}) : super(key: key);

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Banana Squad", messageText: "Awesome Setup", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "Now"),
    ChatUsers(name: "Ice Squad", messageText: "That's Great", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "Yesterday"),
    ChatUsers(name: "Strawberry Squad", messageText: "Hey where are you?", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "31 Mar"),
    ChatUsers(name: "Pizza Squad", messageText: "Busy! Call me in 20 mins", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "28 Mar"),
    ChatUsers(name: "Fire Squad", messageText: "Thankyou, It's awesome", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "23 Mar"),
    ChatUsers(name: "Chicken Squad", messageText: "will update you in evening", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHw61aJTjQCsqpva2gllyHZ9Us4dK24MkLsA&usqp=CAU", time: "17 Mar"),    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Text Channels",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                    // Container(
                    //   padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                    //   height: 30,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     color: Colors.pink[50],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Icon(Icons.add,color: Colors.pink,size: 20,),                        
                    //       SizedBox(width: 2,),
                    //       Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
