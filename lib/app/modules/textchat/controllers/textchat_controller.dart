import 'package:emeraldchat_mobile/app/modules/textchat/views/textchat_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class TextchatController extends GetxController {
  Rx<double> sliderRange = 10.0.obs; 
  Rx<double> karmaRange = 10.0.obs; 
  bool genderFilter = false;
  final count = 0.obs;
  
  @override
  void onInit() {   
    
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

  void setRange(double sliderRange) {
    this.sliderRange.value = sliderRange; 
  }
  void setKarmaRange(double range) {
    karmaRange.value = range; 
  }

  void start1on1TextChat() async {
      final prefs = await SharedPreferences.getInstance();                 
     Get.to(()=>TextchatView());     
  }

}
