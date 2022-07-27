import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_algoriza/features/notifiacationScreen/presention/notifiacationScreen/notification.dart';
import 'package:todo_algoriza/util/Bloc/cubit.dart';
import 'package:todo_algoriza/util/constant/constant.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    _configureLocalTimeZone();
    //tz.setLocalLocation(tz.getLocation(timeZoneName));

    final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('appicon');

    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
          selectNotification(payload!);
        });
  }


  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    NavigateTo(context: context, router: NotificationScreen(payload: payload));
  }

  requestIOSPermissions() {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
      sound: true,
      alert: true,
      badge: true,
    );


  }
//display notification at same time
  displayNotification({required String Title, required String body}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    IOSNotificationDetails iosPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, Title, body, platformChannelSpecifics,
        payload: 'Default_Sound');
  }

//display notification at after 5 sec

  scheduledNotification(int hour, int minutes,  task) async {

    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!,
      task.title,
      task.deadline,
      //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      _nextInstanceOfTenAM(hour, minutes,),
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name', channelDescription:'your channel description'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,

      payload: "${task.title}|"+"${task.deadline}|",
    );
  }


  tz.TZDateTime _nextInstanceOfTenAM(int hour, int minutes ) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
      // var foramtDate =DateFormat.yMd().parse(dateline);
      //
      //
      // if (remind =='1 day before'){
      //   scheduledDate = scheduledDate.subtract(const Duration(days: 1));
      // }
      // if (remind =='1 hour before'){
      //   scheduledDate = scheduledDate.subtract(const Duration(hours: 1));
      // }
      // if (remind =='1 day before'){
      //   scheduledDate = scheduledDate.subtract(const Duration(days: 1));
      // }
      // if (remind =='30 min before'){
      //   scheduledDate = scheduledDate.subtract(const Duration(minutes: 30));
      // }
      // if (remind =='10 min before'){
      //   scheduledDate = scheduledDate.subtract(const Duration(minutes: 30));
      // }
      // if (remind =='Daily'){
      //   scheduledDate = tz.TZDateTime(tz.local ,now.year,now.month ,(foramtDate.day)+1 ,hour,minutes);
      // }
      // if (remind =='Weekly'){
      //   scheduledDate = tz.TZDateTime(tz.local ,now.year,now.month ,(foramtDate.day)+7 ,hour,minutes);
      // }
      // if (remind =='Monthly'){
      //   scheduledDate = tz.TZDateTime(tz.local ,now.year,(foramtDate.month) +1  ,(foramtDate.day) ,hour,minutes);
      // }


    }
    return scheduledDate;


  }
  Future<void> _configureLocalTimeZone() async{
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  cancleNotification(task) async{
    flutterLocalNotificationsPlugin.cancel(task['id']);

  }
// older IOS
  Future<void> onDidReceiveLocalNotification(
      int id,
      String? title,
      String? body,
      String? payload,
      ) async {
    // display a dialog with the notification details, tap ok to go to another page

    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(milliseconds: 1),
      content: Container(
        height: 50.0,
        child: Center(
          child: Row(
            children: [
              new Text(
                title!,
              ),
              Spacer(),
              TextButton(
                child: Text('Ok'),
                onPressed: () async {
                  // Navigator.of(context, rootNavigator: true).pop();
                  NavigateTo(
                      context: context,
                      router: NotificationScreen(payload: payload!));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



}
