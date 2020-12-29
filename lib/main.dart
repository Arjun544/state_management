import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(GetMaterialApp(home: HomePage()));

class Controller extends GetxController {
  var ket_qua = 0.obs;
  dynamic cong_1() => ket_qua++;
  dynamic tru_1() => ket_qua--;
}

class HomePage extends GetView<Controller> {

  Controller controller = Get.put(Controller());

  Widget _buildnumber() => Obx (() => '${controller.ket_qua}'
      .text
      .blue600
      .size(50)
      .make());

  Widget _buildbuttoncong(BuildContext context) => 'Cộng'
      .text
      .white
      .size(24)
      .makeCentered()
      .box
      .blue600
      .p4
      .roundedSM
      .makeCentered()
      .h(50)
      .w60(context)
      .onTap(() async{
    controller.cong_1();
  });

  Widget _buildbuttontru(BuildContext context) => 'Trừ'
      .text
      .white
      .size(24)
      .makeCentered()
      .box
      .blue600
      .p4
      .roundedSM
      .makeCentered()
      .h(50)
      .w60(context)
      .onTap(() async{
    controller.tru_1();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          30.heightBox,
          _buildnumber(),
          30.heightBox,
          _buildbuttoncong(context),
          30.heightBox,
          _buildbuttontru(context)
        ].column().centered()
    );
  }
}