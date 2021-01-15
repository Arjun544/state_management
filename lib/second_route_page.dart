import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertPage'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go Back ...'),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}