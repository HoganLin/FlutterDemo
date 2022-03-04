import 'package:get/get.dart';
import 'pay_online_controller.dart';

class PayOnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PayOnlineController>(
        // PayOnlineController(apiRepository: Get.find()));
        PayOnlineController());
  }
}
