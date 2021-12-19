import 'package:flutter_demo/route/route_config.dart';
import 'package:get/get.dart';

class TestController extends GetxController{

  RxBool showCheckButton = true.obs;
  RxBool showMoreCheck = false.obs;


  void showCheck(){
    showMoreCheck.value = !showMoreCheck.value;
  }

  void toCameraPage(){
    Get.toNamed(RouteConfig.camera);
  }

}