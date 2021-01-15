import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:state_management/home_page.dart';
import 'package:state_management/second_route_page.dart';

void main() {
  runApp(
      GetMaterialApp(
          home: HomePage()
      )
  );
}