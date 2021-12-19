import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constants_color.dart';
import 'package:flutter_demo/modules/test/test_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.colorF3F3F3,
      appBar: AppBar(
        title: const Text("标题"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
        child: Column(
          children: [
            buildContent(context),
            buildApproveInformation(),
            Obx(() => controller.showCheckButton.value
                ? buildButton() : const SizedBox()),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                      child: InkWell(
                        onTap: controller.toCameraPage,
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "拍照：",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(height: 5),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildApproveInformation() {
    return Obx(() => Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      height: controller.showMoreCheck.value
          ? 54 + 51 + 3 * 39 : 52,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 22, top: 5, bottom: 5),
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    child: const Text(
                      "Title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 12),
                  child: InkWell(
                    onTap: () {
                      controller.showCheck();
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Obx(() => controller.showMoreCheck.value
                            ? const Icon(Icons.remove_circle_outline, color: Colors.blue)
                            : const Icon(Icons.add_circle_outline, color: Colors.blue))
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: SingleChildScrollView(
              child: controller.showMoreCheck.value
                  ? Container(
                height: 51 + 3 * 39,
                margin: const EdgeInsets.only(top: 0),
                // padding: EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    const Divider(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 6, left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 1, right: 2),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black38),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black38),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2, right: 1),
                            child: Text(
                              "Person",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 5),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 0),
                        // color: ColorConstants.black38,
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            reverse: false,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildItem(index, "controller.logList[index]");
                            }),
                      ),
                    )
                  ],
                ),
              ) : const SizedBox(),
            ),),
          ]
        )
      ),
    );
  }

  Widget buildButton() {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //controller.saveCheck(0);
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                alignment: Alignment.center,
                height: 40,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue),
                child:
                const Text("cancel", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            InkWell(
              onTap: () {
                //controller.saveCheck(1);
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                alignment: Alignment.center,
                height: 40,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue),
                child:
                const Text("ok", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItem(i, itemData) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 14),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "2021-12-04",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black38),
                  ),
                  Text(
                    "0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black38),
                  ),
                  Text(
                    "dd",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(height: 0,)
      ],
    );
  }
}
