// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';


import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
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
    print(captcha);
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
        print(response.headers!['set-cookie']);        
        String? rawCookie = response.headers!['set-cookie'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('cookie', rawCookie!);        
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
          'Cookie': cookie.toString()
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
    final prefs = await SharedPreferences.getInstance();
    final String? cookie = prefs.getString('cookie');         
    try {
      Response response = await get(
        "https://emeraldchat.com/current_user_interests_json",                
        headers: 
        {
          'Accept': 'application/json',
          'Cookie': cookie.toString()
          },    
        );   
      print(response.body);      
      return Response(statusCode: response.statusCode, body: response.body);
    } catch (e) {           
      return Response(statusText: e.toString());
    }     
  }  

  Future socketConnection() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cookie = prefs.getString('cookie');   
    print(cookie);
    final channel = IOWebSocketChannel.connect(
    Uri.parse('wss://emeraldchat.com/cable'),    
     headers: {             
        'Host': 'emeraldchat.com',
        'Connection': 'Upgrade',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36',
        'Upgrade': 'websocket',
        'Origin': 'https://emeraldchat.com',
        'Sec-WebSocket-Version': '13',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'en-US,en;q=0.9',       

        'Cookie': cookie,

        'Sec-WebSocket-Extensions': 'permessage-deflate; client_max_window_bits',                              
        }, 
    );    
   channel.stream.listen(
        (dynamic message) {          
          print('message $message');
        },         
        onDone: () {
          print('ws channel closed');                 
        },
        onError: (error) {
          print('ws error $error');
        },
      );      
  }
}
