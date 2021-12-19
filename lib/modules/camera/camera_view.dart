import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/modules/camera/camera.dart';

class CameraView extends GetView<MyCameraController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildCameraArea(),
          _buildTopBar(),
          _buildAction(),
        ],
      ),
    );
  }

  Widget _buildCameraArea() {
    // if (!controller.cameraController.value.isInitialized) {
    //   return Container();
    // }

    return Center(
      child: RepaintBoundary(
        key: controller.cameraKey,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: controller.aspectRatio,
              child: Obx(() => _cameraArea()),
            ),
            Positioned(
              left: 10,
              right: 120,
              bottom: 10,
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.time.value,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      controller.address.value,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraArea() {
    Widget area;
    if (controller.takeStatus.value == TakeStatus.confirm) {
      area = Image.file(
        File(controller.curFile.path),
        fit: BoxFit.fitWidth,
      );
    } else if (controller.cameraController.value.isInitialized) {
      final screenWidth = MediaQuery.of(Get.context!).size.width;
      area = ClipRect(
        child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                  width: screenWidth,
                  height: screenWidth *
                      controller.cameraController.value.aspectRatio,
                  child: CameraPreview(controller.cameraController),
                ))),
      );
    } else {
      area = Container(
        color: Colors.black,
      );
    }
    return area;
  }

  Widget _buildTopBar() {
    return Obx(
      () => controller.takeStatus.value == TakeStatus.confirm
          ? Container()
          : Positioned(
              top: MediaQuery.of(Get.context!).padding.top + 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      color: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 32,
                      ),
                      onPressed: () => Get.back()),
                  IconButton(
                    color: Colors.white,
                    icon: Image.asset(
                      controller.flashIcon.value,
                      width: 32,
                      height: 32,
                    ),
                    onPressed: controller.toggleFlash,
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildAction() {
    return Positioned(
      bottom: 50,
      left: 50,
      right: 50,
      child: Obx(
        () => controller.takeStatus.value == TakeStatus.confirm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: InkWell(
                      onTap: controller.cancel,
                      borderRadius: BorderRadius.circular(25),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: InkWell(
                      onTap: controller.confirm,
                      borderRadius: BorderRadius.circular(25),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: InkWell(
                      onTap: controller.takePicture,
                      borderRadius: BorderRadius.circular(30),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// Future<File> takeWatermarkPhoto(BuildContext context, {
//   double aspectRatio,
//   double pixelRatio,
// }) async  {
//   return await Navigator.of(context).push(PageRouteBuilder(
//     opaque:false,
//     pageBuilder: (BuildContext context, Animation<double> animation,Animation<double> secondaryAnimation) {
//       return WatermarkPhoto(aspectRatio: aspectRatio, pixelRatio: pixelRatio);
//     },
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) => FadeTransition(
//       opacity: animation,
//       child: child,
//     ),
//   ));
// }
