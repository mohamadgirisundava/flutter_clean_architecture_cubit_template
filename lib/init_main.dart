import 'dart:io';
import 'package:flutter_clean_architecture_cubit_template/core/constants/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:http/http.dart' as http;

final navigatorKey = GlobalKey<NavigatorState>();

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

//* Global Notification Channel for Android
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'your_channel_id', // id
//   'Notifications', // title
//   description: 'Notification channel for App', // description
//   importance: Importance.high,
//   playSound: true,
//   showBadge: true,
// );

//* Function to initialize the app (orientation, database, Firebase, and notifications)
init() async {
  //* Set screen orientation to portrait
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  //* Initialize Hive database with a custom path
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init('${directory.path}/db');
  await Hive.openBox(DATABASE.dbName);

  //* Initialize Firebase and notifications
  // await _initFirebaseApp();
  // await _initNotification();

  //*Request notification permission for Android 13+
  // if (Platform.isAndroid) {
  // _requestNotificationPermission();
  // }
}

//* Function called when a notification is tapped while the app is in the foreground
// void onDidReceiveNotificationResponse(
//     NotificationResponse notificationResponse) async {
//   final String? payload = notificationResponse.payload;
//   if (payload != null) {
//     debugPrint('Notification payload: $payload');
//   } else {
//     debugPrint('Notification payload: empty');
//   }
// }

//* Function called when a local notification is received (iOS specific)
// void onDidReceiveLocalNotification(
//     int id, String? title, String? body, String? payload) async {
//   showDialog(
//     context: navigatorKey.currentContext!,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(title ?? ""),
//       content: Text(body ?? ""),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           onPressed: () async {
//             Navigator.of(context, rootNavigator: true).pop();
//           },
//           child: const Text('OK'),
//         )
//       ],
//     ),
//   );
// }

//* Notification initialization settings for Android and iOS
// const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('ic_stat_name'); // Set your app icon

// DarwinInitializationSettings initializationSettingsDarwin =
//     const DarwinInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

// final InitializationSettings initializationSettings = InitializationSettings(
//   android: initializationSettingsAndroid,
//   iOS: initializationSettingsDarwin,
// );

//* Function to initialize local notifications for Android and iOS
// void _initNotification() async {
//* Request permissions for iOS
//   final iosPlugin =
//       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>();
//   if (iosPlugin != null) {
//     await iosPlugin.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//* Initialize the notification plugin with settings
// flutterLocalNotificationsPlugin.initialize(
//   initializationSettings,
//   onDidReceiveBackgroundNotificationResponse:
//       onDidReceiveNotificationResponse,
//   onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
// );

//* Create a notification channel for Android
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
// }

//* Function to request notification permission for Android 13+
// void _requestNotificationPermission() async {
//   final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>();

//   if (androidImplementation != null) {
//     final bool? granted =
//         await androidImplementation.requestNotificationsPermission();
//     if (granted == false) {
//* Handle the case where the user denies the permission
//       debugPrint('Notification permission denied');
//     }
//   }
// }

//* Function to initialize Firebase and Firebase App Check
// _initFirebaseApp() async {
//   await Firebase.initializeApp();
//   await FirebaseAppCheck.instance.activate(
//     androidProvider: AndroidProvider.playIntegrity,
//   );
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//* Set notification options for Firebase Messaging
// await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//   alert: true,
//   badge: true,
//   sound: true,
// );

//* Listen for incoming messages while the app is in the foreground
// FirebaseMessaging.onMessage.listen((message) {
//   _showNotification(message);
// });
// }

//* Function to show notifications
// void _showNotification(RemoteMessage message) async {
//   var notificationDetails = NotificationDetails(
//     android: AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       color: Colors.blue,
//       playSound: true,
//       icon: '@drawable/ic_stat_name',
//     ),
//     iOS: const DarwinNotificationDetails(),
//   );

//* Check if the notification contains an image and display it
// if (message.notification?.android?.imageUrl != null ||
//     message.notification?.apple?.imageUrl != null) {
//   String imageUrl = message.notification?.android?.imageUrl ??
//       message.notification?.apple?.imageUrl ??
//       '';
//   var image = await http.get(Uri.parse(imageUrl));
//   notificationDetails = NotificationDetails(
//     android: AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       color: Colors.blue,
//       playSound: true,
//       icon: '@drawable/ic_stat_name',
//       largeIcon: ByteArrayAndroidBitmap.fromBase64String(
//           base64Encode(image.bodyBytes)),
//       styleInformation: BigPictureStyleInformation(
//         ByteArrayAndroidBitmap.fromBase64String(
//             base64Encode(image.bodyBytes)),
//       ),
//     ),
//     iOS: const DarwinNotificationDetails(),
//   );
// }

//* Show the notification
//   flutterLocalNotificationsPlugin.show(
//     11,
//     message.notification?.title,
//     message.notification?.body,
//     notificationDetails,
//   );
// }

//* Background message handler for Firebase Messaging
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background notification
  // debugPrint("Handling a background message: ${message.messageId}");
// }
