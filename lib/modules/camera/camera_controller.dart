import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/utils/log_util.dart';
import 'package:get/get.dart';

class MyCameraController extends SuperController {
  late final double aspectRatio;
  late final double pixelRatio;

  final GlobalKey cameraKey = GlobalKey();
  late CameraController cameraController;
  final RxString time = "".obs;
  final RxString address = "".obs;
  final RxString flashIcon = "images/flash.png".obs;
  final Rx<TakeStatus> takeStatus = TakeStatus.uninitialized.obs;
  late XFile curFile;
  late Timer _timer;
  bool _isCapturing = false;

  @override
  void onInit() async {
    super.onInit();
    var par = Get.parameters;
    aspectRatio = double.parse(par['aspect'] ?? "1.33");
    pixelRatio = double.parse(par['pixel'] ?? "2.0");

    time.value = "time";
    address.value = 'address';
    await _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      List cameras = await availableCameras();
      cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        time.value = DateTime.now().toString();
      });
      takeStatus.value = TakeStatus.preparing;
      cameraController.addListener(() {
        //添加监听切换图标
        setFlashIcon();
      });
      await cameraController.initialize();
      takeStatus.value = TakeStatus.taking;
    } on CameraException catch (e) {
      debugger(message: e.toString());
    }
  }

  // 切换闪光灯
  void toggleFlash() {
    if (!cameraController.value.isInitialized) return;

    switch (cameraController.value.flashMode) {
      case FlashMode.auto:
        cameraController.setFlashMode(FlashMode.always);
        break;
      case FlashMode.off:
        cameraController.setFlashMode(FlashMode.auto);
        break;
      case FlashMode.always:
      case FlashMode.torch:
        cameraController.setFlashMode(FlashMode.off);
        break;
    }
  }

  void setFlashIcon() {
    if (cameraController.value.isInitialized) {
      Log.v(cameraController.value.flashMode.toString(),
          tag: "Camera FlashMode");
      switch (cameraController.value.flashMode) {
        case FlashMode.auto:
          flashIcon.value = 'images/flash_auto.png';
          break;
        case FlashMode.off:
          flashIcon.value = 'images/flash_off.png';
          break;
        case FlashMode.always:
        case FlashMode.torch:
          flashIcon.value = 'images/flash.png';
          break;
      }
    }
  }

  // 拍照
  void takePicture() async {
    if (cameraController.value.isTakingPicture) return;
    _timer.cancel();

    XFile file = await cameraController.takePicture();
    curFile = file;
    takeStatus.value = TakeStatus.confirm;
  }

  // 取消。重新拍照
  void cancel() {
    takeStatus.value = TakeStatus.preparing;
    cameraController.dispose();
    _initCamera();
  }

  // 确认。返回图片数据
  void confirm() async {
    if (_isCapturing) return;
    _isCapturing = true;
    try {
      RenderRepaintBoundary boundary =
          cameraKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List imgBytes = byteData!.buffer.asUint8List();
      Navigator.of(Get.context!).pop(imgBytes);
    } catch (e) {
      debugger(message: e.toString());
    }
    _isCapturing = false;
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    _timer.cancel();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {
    cameraController.dispose();
  }

  @override
  void onPaused() {}

  @override
  void onResumed() {
    _initCamera();
  }
}

enum TakeStatus {
  ///未初始化
  uninitialized,

  /// 准备中
  preparing,

  /// 拍摄中
  taking,

  /// 待确认
  confirm,

  /// 已完成
  done
}
