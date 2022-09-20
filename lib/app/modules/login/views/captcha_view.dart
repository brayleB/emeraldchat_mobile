// ignore_for_file: prefer_collection_literals, prefer_const_constructors, avoid_print

import 'package:emeraldchat_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:emeraldchat_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:get/get.dart';

class CaptchaView extends GetView<LoginController> {
  final String? email, password;
  final loginController = Get.find<LoginController>();
 CaptchaView({Key? key, required this.email, required this.password}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CaptchaView'),
        centerTitle: true,
      ),
      body: Center(
        child:   
          WebViewPlus(          
          javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller){
            controller.loadUrl("assets/webpages/captcha.html");
          },          
          javascriptChannels: Set.from([
            JavascriptChannel(name: 'Captcha', onMessageReceived: (JavascriptMessage message){
              loginController.validateFields(message.message.toString());
              print(message.message);  
              print(loginController.txtEmail.text);      
            })
          ]),
        ),
      ),
    );
  }
}
