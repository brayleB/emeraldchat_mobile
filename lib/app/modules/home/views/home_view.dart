import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/components/rounded_button.dart';
import 'package:emeraldchat_mobile/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final storeController = Get.put(HomeController());
  final homeController = Get.find<HomeController>();
  
  HomeView({Key? key}) : super(key: key);
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
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      "Emerald Chat Mobile",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,                      
                    ),
                    SizedBox(height: size.height * 0.02),
                                Image.asset(
                      "assets/images/logo7.png",
                      height: size.height * 0.15,
                    ),                 
                    SizedBox(height: size.height * 0.03),
                    const Text(
                      "Sign in to your account to access Emerald Chat With Emerald you can talk to people from around the world for free. Click the 'I'm not a robot' box and get started.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.05),
                                     
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                        textColor: txtColorLight,
                      bgcolor: txtColorDark,
                      text: "START",
                      press: () { 
                        Get.to(() => LoginView());
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
