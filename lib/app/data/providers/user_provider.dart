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
          'Cookie': cookie.toString()
        },    
        );      
        print(response.request!.headers); 
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

        'Cookie': '_ga=GA1.2.532322096.1663817054; __auc=05feef1e183633a688b468d4fc9; __stripe_mid=0aa1aa29-817f-4506-b045-d42ed9256e986bd729; _gid=GA1.2.353753828.1664261036; __asc=df2fd6f61837db05ecaad5cc770; __stripe_sid=e98eaba7-4bd2-4a24-b2f6-0e11e65b742bcbc941; user_id=MjU2Njg4OTc%3D--16fc806aa28d107b71038113a1754d1246801bb3; remember_token=rDGxVlZusF0VJLFb8xJ0ww; _prototype_app_session=MndORHQvY1EyZklwanZiYzhCWWFUVDNrSDRnVklrZVZwYm9yZmRZa2xZN3VybGlzcXR5VmpFaHVueEloTUdLa21nZXZBQWRFd21IeVY2cE9xbkwzaWhOMy9LaEpXK1RWQ1YzTkFUSHZOemNNMHBDRERRTWJicTNEc0hVZytWakdtUE5sb3BiaXhqTFY0QVNURStWcFFmbmQvemszVGVCZE90ZVhqdEtNSnhGYTVBa2dJLzZxU0ZkSEdnQjhDQkVieXFtVmtmWGI0SVNtWDlmZXJxYkFyTExDdE9GQXJpRmRHQ245RnEzbTA0bz0tLUJ6d3FOWG5wQXowS1c4U0Y2aEZGNEE9PQ%3D%3D--94b1953b33a89ed32b3a08eb86f182922dc62535; _gat=1,',    

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
