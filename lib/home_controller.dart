import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:state_management/second_route_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeController extends GetxController {
  FlutterLocalNotificationsPlugin fltrNotification;
  String selectedParam;
  String task;
  int val;

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var androidInitilize = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(
        android: androidInitilize,
        iOS: iOSinitilize
    );
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max,
        priority: Priority.max
    );
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(
        android: androidDetails,
        iOS: iOSDetails
    );

    var scheduledTime;
    if (selectedParam == "Hours") {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(hours: val));
    } else if (selectedParam == "Minutes") {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(minutes: val));
    } else {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: val));
    }

    await fltrNotification.zonedSchedule(
        0,
        'scheduled title',
        task,
        scheduledTime,
        generalNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime);
  }

  Future notificationSelected(String payload) async {
    showDialog(
      context: null,
      builder: (context) => AlertDialog(
        content: Text("Notification Clicked $payload"),
      ),
    );
  }
}
