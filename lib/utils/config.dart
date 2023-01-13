
import 'dart:math' as m;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'app_func.dart';

class Configurations{
  static const _apiKey = "AIzaSyAuClARQDdQg6-PRpW4Foze6YUvBf0WARI";
  static const _authDomain = "baikup-pro.firebaseapp.com";
  static const _projectId = "baikup-pro";
  static const _storageBucket = "baikup-pro.appspot.com";
  static const _messagingSenderId ="981996463741";
  static const _appId = "1:981996463741:web:ab955dfd2f15017b473314";

  static bool isFlutterLocalNotificationsInitialized = false;

  //Make some getter functions
  String get apiKey => _apiKey;
  String get authDomain => _authDomain;
  String get projectId => _projectId;
  String get storageBucket => _storageBucket;
  String get messagingSenderId => _messagingSenderId;
  String get appId => _appId;
}

class Configurations2{
  static const _apiKey = "AIzaSyAChj3uXiIO5-CTrh6bX_iQN2iASIm4WwA";
  static const _authDomain = "mva-dev-5943d.firebaseapp.com";
  static const _projectId = "mva-dev-5943d";
  static const _storageBucket = "mva-dev-5943d.appspot.com";
  static const _messagingSenderId ="746646617510";
  static const _appId = "1:746646617510:web:518d3c3ac41b6127622367";

//Make some getter functions
  String get apiKey => _apiKey;
  String get authDomain => _authDomain;
  String get projectId => _projectId;
  String get storageBucket => _storageBucket;
  String get messagingSenderId => _messagingSenderId;
  String get appId => _appId;
}

String mainKey = "";
late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> setupFlutterNotificationsCreateChannel() async {
  if (Configurations.isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.high,);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);


  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  Configurations.isFlutterLocalNotificationsInitialized = true;

}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  //AndroidNotification? android = message.notification?.android;
  if (notification != null) {
    flutterLocalNotificationsPlugin.show(
      m.Random().nextInt(1500),
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          icon: 'launch_background',
        ),
      ),
    );
  }


  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    log('Message clicked!');
    log(message);
    mainKey = message.data['key'];
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();
  // if(currentEnv==ENV_MODE.dev) {
  //   await Firebase.initializeApp(name: 'secondary', options: FirebaseOptions(apiKey: Configurations2().apiKey,
  //       appId: Configurations2().appId, messagingSenderId: Configurations2().messagingSenderId,
  //       projectId: Configurations2().projectId, storageBucket: Configurations2().storageBucket));
  // }

  await setupFlutterNotificationsCreateChannel();
  log("Handling a background message: ${message.messageId}");
  showFlutterNotification(message);
}

