// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:path/path.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:todo_algoriza/features/notification.dart';
// import 'package:todo_algoriza/util/constant/constant.dart';
//
//
// class NotifyHelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   String selectedNotificationPayload = '';
//
//   final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();
//   initializeNotification() async {
//     tz.initializeTimeZones();
//     _configureSelectNotificationSubject();
//     await _configureLocalTimeZone();
//     // await requestIOSPermissions(flutterLocalNotificationsPlugin);
//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('appicon');
//
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       iOS: initializationSettingsIOS,
//       android: initializationSettingsAndroid,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: (String? payload) async {
//         if (payload != null) {
//           debugPrint('notification payload: ' + payload);
//         }
//         selectNotificationSubject.add(payload!);
//       },
//     );
//   }
//
//   displayNotification({required String title, required String body}) async {
//     print('doing test');
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//         'your channel id', 'your channel name', channelDescription:'your channel description',
//         importance: Importance.max, priority: Priority.high);
//     var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'Default_Sound',
//     );
//   }
//
//   scheduledNotification(int hour, int minutes, id,title,startTime) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id!,
//       title,
//       startTime,
//       //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//       _nextInstanceOfTenAM(hour, minutes),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//             'your channel id', 'your channel name', channelDescription:'your channel description'),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//       payload: '${title}|${startTime}|',
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOfTenAM(int hour, int minutes) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   void requestIOSPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   Future<void> _configureLocalTimeZone() async {
//     tz.initializeTimeZones();
//     final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//   }
//
// /*   Future selectNotification(String? payload) async {
//     if (payload != null) {
//       //selectedNotificationPayload = "The best";
//       selectNotificationSubject.add(payload);
//       print('notification payload: $payload');
//     } else {
//       print("Notification Done");
//     }
//     Get.to(() => SecondScreen(selectedNotificationPayload));
//   } */
//
// //Older IOS
//   Future onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     /* showDialog(
//       context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: const Text('Title'),
//         content: const Text('Body'),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: const Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Container(color: Colors.white),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//  */
//     SnackBar(
//       backgroundColor: Colors.red,
//       duration: Duration(milliseconds: 1),
//       content: Container(
//         height: 50.0,
//         child: Center(
//           child: Row(
//             children: [
//               new Text(
//                 title!,
//               ),
//               Spacer(),
//               TextButton(
//                 child: Text('Ok'),
//                 onPressed: () async {
//                   // Navigator.of(context, rootNavigator: true).pop();
//                   NavigateTo(
//                       context: context,
//                       router: NotificationScreen(payload: payload!));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _configureSelectNotificationSubject() {
//     selectNotificationSubject.stream.listen((String payload) async {
//       debugPrint('My payload is ' + payload);
//        NavigateTo(context: context, router: NotificationScreen(payload: payload));
//     });
//   }
// }
