import 'package:emeraldchat_mobile/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class TextchatController extends GetxController {
  UserProvider userProvider = UserProvider();
  Rx<double> sliderRange = 10.0.obs; 
  Rx<double> karmaRange = 10.0.obs; 
  bool genderFilter = false;
  final count = 0.obs;
  
  @override
  void onInit() {   
    getInterests();
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

  void setRange(double sliderRange) {
    this.sliderRange.value = sliderRange; 
  }
  void setKarmaRange(double range) {
    karmaRange.value = range; 
  }
  
  void getInterests() async {
    Response respUserInterests = await userProvider.getCurrentUserInterests();
    if(respUserInterests.statusCode==200){
      print(respUserInterests.body['interests'].toString());
    }         
  }

}
