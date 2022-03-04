import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/route/route_config.dart';
import 'package:get/get.dart';

void main() {
  //debugProfileBuildsEnabled = true;
  //debugProfilePaintsEnabled = true;
  //debugPaintLayerBordersEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConfig.payOnline,
      getPages: RouteConfig.getPages,
    );
  }

}
