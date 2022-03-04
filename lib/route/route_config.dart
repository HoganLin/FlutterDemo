import 'package:flutter_demo/modules/camera/camera.dart';
import 'package:flutter_demo/modules/pay_online/pay_online.dart';
import 'package:flutter_demo/modules/test/test_bindings.dart';
import 'package:flutter_demo/modules/test/test_view.dart';
import 'package:get/get.dart';

class RouteConfig{

  static const String test = "/test/test";
  static const String camera = "/camera/camera";
  static const String payOnline = "/pay_online/pay_online";

  static final List<GetPage> getPages = [
    GetPage(
      name: test,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: camera,
      page: () => const CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: payOnline,
      page: () => const PayOnlineScreen(),
      binding: PayOnlineBinding(),
    ),
  ];
}