import 'package:get/get.dart';

import '../controllers/videochat_controller.dart';

class VideochatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideochatController>(
      () => VideochatController(),
    );
  }
}
