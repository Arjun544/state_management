import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (task) {
                  homeController.task = task;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: homeController.selectedParam,
                  items: [
                    DropdownMenuItem(
                      child: Text("Seconds"),
                      value: "Seconds",
                    ),
                    DropdownMenuItem(
                      child: Text("Minutes"),
                      value: "Minutes",
                    ),
                    DropdownMenuItem(
                      child: Text("Hours"),
                      value: "Hours",
                    ),
                  ],
                  hint: Text(
                    "Select Your Field.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (selectedParam) {
                    homeController.selectedParam = selectedParam;
                  },
                ),
                DropdownButton(
                  value: homeController.val,
                  items: [
                    DropdownMenuItem(
                      child: Text("1"),
                      value: 11,
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: 22,
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: 33,
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: 44,
                    ),
                  ],
                  hint: Text(
                    "Select Value",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {
                    homeController.val = val;
                  },
                ),
              ],
            ),
            RaisedButton(
              onPressed: homeController.showNotification,
              child: new Text('Set Task With Notification'),
            )
          ],
        ),
      ),
    );
  }
}
