import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  
  @override
  void onInit() {
    showData();
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

 void showData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? awd = pref.getString('display_name');
  EasyLoading.showToast('Welcome $awd');
 }
}
