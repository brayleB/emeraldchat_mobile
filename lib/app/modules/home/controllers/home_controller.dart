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

  checkIfLoggedIn();
  final prefs = await SharedPreferences.getInstance();
  final String? cookie = prefs.getString('cookie');   
  final channel = IOWebSocketChannel.connect(
    Uri.parse('wss://emeraldchat.com/cable'),
    pingInterval: Duration(seconds: 5),
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
        'Cookie': ' _ga=GA1.2.532322096.1663817054; __auc=05feef1e183633a688b468d4fc9; __stripe_mid=0aa1aa29-817f-4506-b045-d42ed9256e986bd729; _gid=GA1.2.353753828.1664261036; __asc=df2fd6f61837db05ecaad5cc770; __stripe_sid=e98eaba7-4bd2-4a24-b2f6-0e11e65b742bcbc941; user_id=MjU2Njg4OTc%3D--16fc806aa28d107b71038113a1754d1246801bb3; remember_token=rDGxVlZusF0VJLFb8xJ0ww; _prototype_app_session=MndORHQvY1EyZklwanZiYzhCWWFUVDNrSDRnVklrZVZwYm9yZmRZa2xZN3VybGlzcXR5VmpFaHVueEloTUdLa21nZXZBQWRFd21IeVY2cE9xbkwzaWhOMy9LaEpXK1RWQ1YzTkFUSHZOemNNMHBDRERRTWJicTNEc0hVZytWakdtUE5sb3BiaXhqTFY0QVNURStWcFFmbmQvemszVGVCZE90ZVhqdEtNSnhGYTVBa2dJLzZxU0ZkSEdnQjhDQkVieXFtVmtmWGI0SVNtWDlmZXJxYkFyTExDdE9GQXJpRmRHQ245RnEzbTA0bz0tLUJ6d3FOWG5wQXowS1c4U0Y2aEZGNEE9PQ%3D%3D--94b1953b33a89ed32b3a08eb86f182922dc62535; _gat=1',
        // 'Sec-WebSocket-Key': 'LbJ/gBj+M0XA+m64aZwL3g==',
        'Sec-WebSocket-Extensions': 'permessage-deflate; client_max_window_bits',
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
