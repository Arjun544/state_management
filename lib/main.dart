import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:state_management/home_controller.dart';
import 'package:state_management/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HomeController homeController = Get.put(HomeController());
  await homeController.configureLocalTimeZone();
  runApp(
      GetMaterialApp(
          home: HomePage()
      )
  );
}