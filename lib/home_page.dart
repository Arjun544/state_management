import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Local Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.showNotification,
        tooltip: 'Increment',
        child: Icon(Icons.notifications),
      ),
    );
  }
}
