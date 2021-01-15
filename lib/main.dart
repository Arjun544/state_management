import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:state_management/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();//thieu dong` nay`
  runApp(
      GetMaterialApp(
          home: HomePage()
      )
  );
}