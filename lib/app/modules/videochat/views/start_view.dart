// ignore_for_file: prefer_const_constructors

import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/components/gender_dropdown.dart';
import 'package:emeraldchat_mobile/app/components/rounded_button.dart';
import 'package:emeraldchat_mobile/app/components/rounded_input_field.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/controllers/videochat_controller.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/views/test_camera_view.dart';
import 'package:emeraldchat_mobile/app/modules/videochat/views/videochat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StartVideoChatView extends GetView {
  final txtChatCont = Get.put(VideochatController());
  final TextEditingController txtEmail = TextEditingController();
  StartVideoChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _currentSliderValue = 2;
    Size size = MediaQuery.of(context).size;
    return Scaffold(   
      body: Container(
        color: Colors.blueGrey.shade900,
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                        textColor: Colors.white,
                      bgcolor: txtColorDark,
                      text: "Test your camera here",
                      press: () { 
                        Get.to(()=>TestCameraView());                                                
                      },
                    ), 
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      "Add interest tags",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedInputField(
                      isEnable: true,
                      controller: txtEmail,
                      icon: Icons.tag,
                      hintText: "Enter your tags here",
                      onChanged: (value) {},
                    ),  
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      "Time to wait for someone with your interests",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),               
                    Obx(
                      () => Slider(
                        value: txtChatCont.sliderRange.value,
                        min: 0.0, //initialized it to a double 
                        max: 10.0,  //initialized it to a double 
                        divisions: 10,
                        label: txtChatCont.sliderRange.round().toString(),
                        onChanged: (double value) {
                          txtChatCont.setRange(value);
                        },
                      ),
                    ),                                 
                    SizedBox(height: size.height * 0.04),
                    const Text(
                      "Gender Filter",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.02),
                    RoundedDropDownButton(),
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      "Press Start to begin",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                        textColor: Colors.white,
                      bgcolor: txtColorDark,
                      text: "Start",
                      press: () { 
                        Get.to(()=>VideochatView());                                                
                      },
                    ),                                                                                    
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}