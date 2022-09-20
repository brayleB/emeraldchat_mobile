// ignore_for_file: prefer_const_constructors

import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/data/dashboard_items.dart';
import 'package:emeraldchat_mobile/app/modules/groupchat/views/groupchat_view.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/views/start_view.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/views/textchat_view.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/views/start_view.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/views/videochat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final storeController = Get.put(DashboardController());
  final dashboardController = Get.find<DashboardController>();
  DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<DashboardItems> myList = [dashboardItems[0], dashboardItems[1], dashboardItems[2]];
    Size size = MediaQuery.of(context).size;
    return Scaffold( 
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu,  
              ),
          ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
                Icons.notifications_outlined,  
              ),
            ),
          IconButton(onPressed: (){}, icon: Icon(
                Icons.email_outlined 
              ),
            ),
          IconButton(onPressed: (){}, icon: Icon(
                Icons.settings 
              ),
            ),
        ],
        ),
      body: Container(
          margin: EdgeInsets.only(top:size.height*0.05),
          decoration: BoxDecoration(            
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: GridView.count(
                      childAspectRatio: 2.5,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      crossAxisCount: 1,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      children: myList.map((data) {
                        return GestureDetector(
                            onTap: () async {
                              if (data.id == 1) {
                                Get.to(StartView());
                              } 
                              else if(data.id == 2) {
                                Get.to(StartVideoChatView());
                              } 
                              else if(data.id == 3) {
                                Get.to(GroupchatView());
                              } 
                            },
                            child: Container(                              
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade400,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      data.img!,
                                      width: 75,
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.title!,
                                      style: TextStyle(
                                          color: txtColorWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(                                                                         
                                      data.details!,
                                      style: TextStyle(                                                        
                                          color: txtColorWhite,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,   
                                    ),                                   
                                  ]),
                            ));
                      }).toList()),          
                ),                          
            ],
          ),
        )
    );
  }
}


