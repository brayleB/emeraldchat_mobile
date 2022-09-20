// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emeraldchat_mobile/app/components/checkbox.dart';
import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/components/gender_dropdown.dart';
import 'package:emeraldchat_mobile/app/components/rounded_button.dart';
import 'package:emeraldchat_mobile/app/components/rounded_input_field.dart';
import 'package:emeraldchat_mobile/app/components/rounded_password_field.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/controllers/textchat_controller.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/views/textchat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StartView extends GetView<StatefulWidget> {
  final txtChatCont = Get.put(TextchatController());
  final TextEditingController txtEmail = TextEditingController();
  
  StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: size.height * 0.10),              
                    Text(
                      "Press Start to begin",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                        textColor: txtColorLight,
                      bgcolor: txtColorDark,
                      text: "Start",
                      press: () { 
                        txtChatCont.start1on1TextChat();                                              
                      },
                    ), 
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      "Add interest tags",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Colors.white),
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
                    Text(
                      "Time to wait for someone with your interests",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
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
                    SizedBox(height: size.height * 0.05),
                    Row(
                        children: [
                          CheckBox(val: txtChatCont.genderFilter),
                          Text(
                            "Gender Filter",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,                      
                          ),
                          SizedBox(width: size.width * 0.03),                       
                          RoundedDropDownButton() ,
                        ]
                      ),                                                             
                    SizedBox(height: size.height * 0.04),                         
                      Row(
                        children: [
                          CheckBox(val: txtChatCont.genderFilter),
                          Text(
                            "Dont match me to anonymous \naccounts",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.left,                      
                          ),
                        ]
                      ), 
                    SizedBox(height: size.height * 0.04),  
                    Row(
                        children: [
                          CheckBox(val: txtChatCont.genderFilter),
                          Text(
                            "Only match to users with \nkarma more than",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.left,                      
                          ),
                        ]
                      ),               
                    Obx(
                      () => Slider(
                        value: txtChatCont.karmaRange.value,
                        min: 0.0, 
                        max: 100.0,  
                        divisions: 100,
                        label: txtChatCont.karmaRange.round().toString(),
                        onChanged: (double value) {
                          txtChatCont.setKarmaRange(value);
                        },
                      ),
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