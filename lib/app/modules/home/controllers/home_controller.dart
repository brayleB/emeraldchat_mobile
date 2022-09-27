// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:emeraldchat_mobile/app/data/providers/user_provider.dart';
import 'package:emeraldchat_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  UserProvider userProvider = UserProvider();

  final count = 0.obs;
  @override
  void onInit() async { 
    print('sampple');
  final prefs = await SharedPreferences.getInstance();
  final String? cookie = prefs.getString('cookie'); 
  print(cookie)  ;
  final channel = IOWebSocketChannel.connect(
    Uri.parse('wss://emeraldchat.com/cable'),
    pingInterval: Duration(seconds: 5),
     headers: {             
        'Host': 'emeraldchat.com',
        'Connection': 'Upgrade',
        // 'Pragma': 'no-cache',
        // 'Cache-Control': 'no-cache',
        // 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36',
        'Upgrade': 'websocket',
        // 'Origin': 'https://emeraldchat.com',
        // 'Sec-WebSocket-Version': '13',
        // 'Accept-Encoding': 'gzip, deflate, br',
        // 'Accept-Language': 'en-US,en;q=0.9',
        'Cookie': cookie.toString,
        // 'Sec-WebSocket-Key': 'LbJ/gBj+M0XA+m64aZwL3g==',
        // 'Sec-WebSocket-Extensions': 'permessage-deflate; client_max_window_bits',
        // 'Sec-WebSocket-Protocol': 'actioncable-v1-json, actioncable-unsupported '                             
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
    // checkIfLoggedIn();
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

  void increment() => count.value++;

  void checkIfLoggedIn() async {
    Response respCurrentUser = await userProvider.getCurrentUser();
        if(respCurrentUser.statusCode==200){              
          if(respCurrentUser.body['gold']==false){
            EasyLoading.showInfo("You are non gold user.");
          }
          else if (respCurrentUser.body['gold']==true){           
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
