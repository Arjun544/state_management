import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:state_management/main.dart';
import 'package:state_management/second_route_page.dart';

class HomeController extends GetxController {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettings;

  void initState() {
    initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showNotification() async {
    await _demoNotification();
  }

  Future<void> _demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics
    );

    await flutterLocalNotificationsPlugin.show(0, 'Show Local Notification',
        'test', platformChannelSpecifics,
        payload: 'test payload');
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: $payload');
    }
    return Get.to(SecondRoute());
  }

}
