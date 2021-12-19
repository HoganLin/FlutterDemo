import 'package:flutter_demo/modules/camera/camera.dart';
import 'package:get/get.dart';

class CameraBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyCameraController());
  }
}