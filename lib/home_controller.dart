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
  var initializationSettingsIOS;
  var initializationSettings;

  void showNotification() async {
    await demoNotification();
  }

  Future<void> demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSChannelSpecifics
    );
    DateTime time=DateTime.now().add(Duration(seconds: 0));
    await flutterLocalNotificationsPlugin.schedule(0, 'Hello, buddy',
        'A message from flutter buddy',time, platformChannelSpecifics,
        payload: 'test oayload');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('Notification payload: $payload');
    }
   Get.to(SecondRoute());
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // await showDialog(
    //     context: context,
    //     builder: (BuildContext context) => CupertinoAlertDialog(
    //       title: Text(title),
    //       content: Text(body),
    //       actions: <Widget>[
    //         CupertinoDialogAction(
    //           isDefaultAction: true,
    //           child: Text('Ok'),
    //           onPressed: () async {
    //             Navigator.of(context, rootNavigator: true).pop();
    //             await Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => SecondRoute()));
    //           },
    //         )
    //       ],
    //     ));
  }

}
