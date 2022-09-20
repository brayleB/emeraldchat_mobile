import 'package:camera/camera.dart';
import 'package:get/get.dart';

class VideochatController extends GetxController {
  Rx<double> sliderRange = 10.0.obs; 

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; 

  final count = 0.obs;
  @override
  void onInit() {
    loadCamera();
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
  
  void loadCamera() async {
      cameras = await availableCameras();
      if(cameras != null){
        controller = CameraController(cameras![1], ResolutionPreset.max);
                    //cameras[0] = first camera, change to 1 to another camera
                    
        controller!.initialize().then((_) {                      
        });
      }else{
        print("NO any camera found");
      }
  }
}
