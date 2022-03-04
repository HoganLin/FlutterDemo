import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayOnlineController extends GetxController {
  //final LocalApiRepository apiRepository;

  //PayOnlineController({required this.apiRepository});
  PayOnlineController();

  late dynamic arguments;
  late dynamic parameters;

  RxString title = "".obs;

  RxInt selectType = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    arguments = Get.arguments;
    parameters = Get.parameters;
    // RLogger.instance?.d("arguments: == ${arguments.toString()}",
    //     tag: "${CommentUtil().getFILE()}/${CommentUtil().getLINE()}");
    // RLogger.instance?.d("parameters: == ${parameters.toString()}",
    //     tag: "${CommentUtil().getFILE()}/${CommentUtil().getLINE()}");
    // if (arguments.toString().isNotEmpty) {
    //   title.value = arguments['title'];
    // }

  }

  // Future requestOrders(int pageNo, bool newList) async {
  //   var query = Map<String, dynamic>();
  //   query['queryType'] = "6";
  //   query['orderNumber'] = "";
  //   query['longitude'] = lng.toString();
  //   query['latitude'] = lat.toString();
  //   query['pageNo'] = pageNo.toString();
  //   query['pageSize'] = 15.toString();
  //   var res = await apiRepository.searchOrder(query);
  //   if (res == null) {
  //     if (newList) {
  //       dataList.clear();
  //       checkList.clear();
  //     }
  //     EasyLoading.dismiss();
  //     return;
  //   } else {
  //     RLogger.instance?.d("订单: == ${res.toString()}",
  //         tag: "${CommentUtil().getFILE()}/${CommentUtil().getLINE()}");
  //
  //   }
  // }

  void buttonTap(index){
    if(!(selectType.value == index)){
      selectType.value = index;
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
