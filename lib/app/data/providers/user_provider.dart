// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
   
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://emeraldchat.com/';
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');

//Login 
  Future<Response> loginCall(String email, String password, String captcha) async {  
  
    EasyLoading.show(status: "Signing-in");
    try {
      Response response = await post(
        "https://emeraldchat.com/login",
        {
          'email':email,
          'password':password,
          'captcha':captcha
        },          
        headers: {'Accept': 'application/json'},    
        );         
        String? rawCookie = response.headers!['set-cookie'];
        if (rawCookie != null) {
          int index = rawCookie.indexOf(';');
          response.headers!['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('cookie', rawCookie);
        }         
      EasyLoading.dismiss();    
      return Response(statusCode: response.statusCode, body: response.body);
    } catch (e) { 
      EasyLoading.dismiss();      
      return Response(statusText: e.toString());
    }     
  }
  
  //current user 
  Future<Response> getCurrentUser() async {  
    final prefs = await SharedPreferences.getInstance();
    final String? cookie = prefs.getString('cookie');
    EasyLoading.show(status: "Getting user data");
    try {
      Response response = await get(
        "https://emeraldchat.com/current_user_json",                
        headers: 
        {
          'Accept': 'application/json',
          'cookie': cookie.toString()
        },    
        );     
         
      EasyLoading.dismiss();    
      return Response(statusCode: response.statusCode, body: response.body);
    } catch (e) { 
      EasyLoading.dismiss();      
      return Response(statusText: e.toString());
    }     
  }

  //current user interests
  Future<Response> getCurrentUserInterests() async {    
    EasyLoading.show(status: "Getting user data");
    try {
      Response response = await get(
        "https://emeraldchat.com/current_user_interests_json",                
        headers: {'Accept': 'application/json'},    
        );   
      print(response.body)    ;
      EasyLoading.dismiss();    
      return Response(statusCode: response.statusCode, body: response.body);
    } catch (e) { 
      EasyLoading.dismiss();      
      return Response(statusText: e.toString());
    }     
  }  
}
