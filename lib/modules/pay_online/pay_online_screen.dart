import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constants_color.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'pay_online_controller.dart';
import 'package:get/get.dart';

class PayOnlineScreen extends GetView<PayOnlineController> {
  const PayOnlineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorConstants.colorF3F3F3,
        // appBar: CommonWidget.appBar(
        //     context, controller.title.value, Icons.arrow_back_ios, Colors.black),
        body: Column(
          children: [
            buildContent(),
            const SizedBox(
              height: 5,
            ),
          ],
        ));
  }

  Widget buildContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "请选择支付方式:",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.buttonTap(0);
                },
                child: Obx(
                      () => Image(
                    image: AssetImage(controller.selectType.value == 0
                        ? "images/page_btn_wenxin_pre.png"
                        : "images/page_btn_wenxin_nor.png"),
                    width: 90,
                  ),
                ),
              ),
              SizedBox(width: 50,),
              InkWell(
                onTap: () {
                  controller.buttonTap(1);
                },
                child: Obx(
                      () => Image(
                    image: AssetImage(controller.selectType.value == 1
                        ? "images/page_btn_zhifubao_pre.png"
                        : "images/page_btn_zhifubao_nor.png"),
                    width: 90,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
