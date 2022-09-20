import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/components/rounded_button.dart';
import 'package:emeraldchat_mobile/app/modules/textchat/views/textchat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PostchatView extends GetView {
  const PostchatView({Key? key}) : super(key: key);
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
                    const Text(
                      "Next",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                        textColor: txtColorLight,
                      bgcolor: txtColorDark,
                      text: "Start",
                      press: () { 
                        Get.to(()=>TextchatView());                                                
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