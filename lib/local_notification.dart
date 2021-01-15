
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:io' show Platform;

import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart';

class LocalnotifiManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;
  BehaviorSubject<ReceiveNotification> get didReceiveNotification =>
      BehaviorSubject<ReceiveNotification>();
  LocalnotifiManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      requestIOSPermission();
    }
    initializePlatform();

  }

  requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(alert: true, badge: true, sound: true);
  }

  initializePlatform() {
    var initSettingAndroid = AndroidInitializationSettings('app');
    var initSettingIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          ReceiveNotification notification = ReceiveNotification(
              id: id, title: title, body: body, payload: payload);
          didReceiveNotification.add(notification);
        });
    initSetting = InitializationSettings(
        android: initSettingAndroid, iOS: initSettingIOS);
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    didReceiveNotification.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  Future setOnNotificationClick(Function onClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (String payload) async {
          await onClick(payload);
        });

  }
  Future getApplaucher()async{
    NotificationAppLaunchDetails notificationAppLaunchDetails=await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    return notificationAppLaunchDetails.didNotificationLaunchApp;
  }
  Future canceNoti(int id){
    flutterLocalNotificationsPlugin.cancel(id);
  }
  dispose(){
    didReceiveNotification.close();
  }

  Future<void> showsheduleNotification(int id,String title,String body,String payload)async{
    BigTextStyleInformation bigTextStyleInformation =
    BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      htmlFormatContentTitle: true,
      htmlFormatSummaryText: true,
    );
    var scheduleDatetime=DateTime.now().add(Duration(seconds: 10));
    var androidChannel=AndroidNotificationDetails("channelId", "channelName", "channelDescription",importance: Importance.max,
        priority: Priority.high,styleInformation: bigTextStyleInformation,
        playSound: true,usesChronometer: false);
    var iosChannel=IOSNotificationDetails();
    var platformChannel= NotificationDetails(android:androidChannel,iOS: iosChannel);
    await flutterLocalNotificationsPlugin.show(id, title, body, platformChannel,payload: payload);

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //     id,
    //     title,
    //     body,
    //     time,
    //    platformChannel,
    //     payload:payload ,
    //     androidAllowWhileIdle: true,
    //     uiLocalNotificationDateInterpretation:
    //     UILocalNotificationDateInterpretation.absoluteTime,
    //     matchDateTimeComponents: DateTimeComponents.time);

  }

  Future<void> showsheduleAtTimeNotification(int id,Time time,String title,String body,String payload)async{
    BigTextStyleInformation bigTextStyleInformation =
    BigTextStyleInformation(
      body,
      contentTitle: title,
      summaryText: body,
      htmlFormatBigText: true,
      htmlFormatContentTitle: true,
      htmlFormatSummaryText: true,
    );
    var scheduleDatetime=DateTime.now().add(Duration(seconds: 10));
    var androidChannel=AndroidNotificationDetails("channelId 1", "channelName 1", "channelDescription 1",importance: Importance.max,
        priority: Priority.high,styleInformation: bigTextStyleInformation,
        playSound: true,usesChronometer: false);
    var iosChannel=IOSNotificationDetails();
    var platformChannel= NotificationDetails(android:androidChannel,iOS: iosChannel);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(id, title, body,Day.monday,time, platformChannel,payload: payload);
  }

  Future<void> repeatSchedule(int id,String title,String body,String payload)async{
    BigTextStyleInformation bigTextStyleInformation =
    BigTextStyleInformation(
      body,
      contentTitle: title,
      summaryText: body,
      htmlFormatBigText: true,
      htmlFormatContentTitle: true,
      htmlFormatSummaryText: true,
    );
    var scheduleDatetime=DateTime.now().add(Duration(seconds: 10));
    var androidChannel=AndroidNotificationDetails("channelId 1", "channelName 1", "channelDescription 1",importance: Importance.max,
        priority: Priority.high,styleInformation: bigTextStyleInformation,
        playSound: true,usesChronometer: false);
    var iosChannel=IOSNotificationDetails();
    var platformChannel= NotificationDetails(android:androidChannel,iOS: iosChannel);
    await flutterLocalNotificationsPlugin.periodicallyShow(id, title, body,RepeatInterval.weekly, platformChannel,payload: payload);
  }

}
LocalnotifiManager localnotifiManager=LocalnotifiManager.init();
class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;
  ReceiveNotification(
      {@required this.id,
        @required this.title,
        @required this.body,
        @required this.payload});
}
