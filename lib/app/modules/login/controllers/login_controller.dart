// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:emeraldchat_mobile/app/components/constants.dart';
import 'package:emeraldchat_mobile/app/data/models/user_model.dart';
import 'package:emeraldchat_mobile/app/data/providers/user_provider.dart';
import 'package:emeraldchat_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with StateMixin <List<User>>{
  UserProvider userProvider = UserProvider();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPass = TextEditingController();
  
  @override
  void onInit() {
    txtEmail.text='lorenz.marqueses22@gmail.com';
    txtPass.text='Qwerty123';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

    Future<void> validateFields(String captcha) async {    
    var err = "";
    if(txtEmail.text==""){
      err="Please enter your email";
    }
    else if(txtPass.text==""){
      err="Please enter your password";
    }
    else
    {         
     Response respLogin = await userProvider.loginCall(txtEmail.text, txtPass.text, captcha);       
     if(respLogin.statusCode==200){           
      if(respLogin.body['status']=='failed'){
        EasyLoading.showInfo('Invalid Credentials');
      }
      else if(respLogin.body['status']=='captcha_failed'){
        EasyLoading.showInfo('Captcha Failed');
      }
      else{
        Response respCurrentUser = await userProvider.getCurrentUser();
        if(respCurrentUser.statusCode==200){ 
          if(respCurrentUser.body['gold']==false){
            EasyLoading.showInfo("You are non gold user.");
          }
          else{           
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setInt('id', respCurrentUser.body['id'] ?? 0);
            await pref.setString('email', respCurrentUser.body['email']?? '');
            await pref.setString('created_at', respCurrentUser.body['created_at'] ?? '');
            await pref.setString('updated_at', respCurrentUser.body['updated_at'] ?? '');
            await pref.setString('display_name', respCurrentUser.body['display_name'] ?? '');
            await pref.setString('bio', respCurrentUser.body['bio'] ?? '');
            await pref.setString('gender', respCurrentUser.body['gender'] ?? '');
            await pref.setInt('karma', respCurrentUser.body['karma'] ?? 0);
            await pref.setBool('verified', respCurrentUser.body['verified'] ?? false);
            await pref.setBool('online', respCurrentUser.body['online'] ?? false);
            await pref.setString('display_picture', respCurrentUser.body['display_picture'] ?? '');
            await pref.setBool('master', respCurrentUser.body['master'] ?? false);
            await pref.setBool('mod', respCurrentUser.body['mod'] ?? false);
            await pref.setString('username', respCurrentUser.body['username'] ?? '');
            await pref.setBool('gold', respCurrentUser.body['gold'] ?? false);       
            Get.to(()=>DashboardView());    
          }  
        }               
      }       
     }
     else{
      Get.snackbar('Error', respLogin.statusText.toString(),backgroundColor: emeraldColor, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM,);
     }          
    }
    if(err!=""){
      EasyLoading.showError(err);
    }
  }

  
  
  
}
