import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/textchat_controller.dart';

class TextchatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextchatController>(
      () => TextchatController(),
    );
  }
  
 
 

}
