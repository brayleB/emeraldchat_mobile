// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/controllers/videochat_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TestCameraView extends GetView { 
  final vidChatCon = Get.put(VideochatController()); 
  TestCameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,        
        ),
          body: Container( 
            alignment: Alignment.center,
            child: Column(              
              children:[
                  Container(
                      height:size.height*0.6,                   
                      child: vidChatCon.controller == null?
                          Center(child:Text("Loading Camera...")):
                                !vidChatCon.controller!.value.isInitialized?
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ):
                                  CameraPreview(vidChatCon.controller!)
                  ), 
                  FloatingActionButton(
                    elevation: 2,
                    onPressed: (){},
                  ),                 
              ]
            )
          ),          
           
       );
  }
}

