// ignore_for_file: prefer_const_constructors

import 'package:emeraldchat_mobile/app/components/already_have_an_account_acheck.dart';
import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/components/rounded_button.dart';
import 'package:emeraldchat_mobile/app/components/rounded_input_field.dart';
import 'package:emeraldchat_mobile/app/components/rounded_password_field.dart';
import 'package:emeraldchat_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:emeraldchat_mobile/app/modules/login/views/captcha_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:emeraldchat_mobile/app/data/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final storeController = Get.put(LoginController());
  final loginController = Get.find<LoginController>();
  LoginView({Key? key}) : super(key: key);

  
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
                      "LOGIN",
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
                      "Sign in to your account to access Emerald Chat ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedInputField(
                      isEnable: true,
                      controller: loginController.txtEmail,
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(           
                      hintText: "Password",
                      controller: loginController.txtPass,
                      onChanged: (value) {},
                    ),                                     
                    SizedBox(height: size.height * 0.01),
                    RoundedButton(
                        textColor: txtColorLight,
                      bgcolor: txtColorDark,
                      text: "LOGIN",
                      press: () {   
                        // loginController.validateFields();     
                        Get.to(()=>CaptchaView(email: loginController.txtEmail.toString(), password: loginController.txtPass.toString(),));  
                        // Get.to(()=>DashboardView());                     
                      },
                    ),                    
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {                      
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
