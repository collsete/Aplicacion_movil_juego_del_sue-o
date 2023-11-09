import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tesis/Src/alarma.dart';
import 'package:tesis/Src/consejos.dart';
import 'package:tesis/Src/drawer.dart';
import 'package:tesis/Src/login_screen.dart';
import 'package:tesis/Src/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
final notifications = FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await notifications.initialize(initializationSettings);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const Loginscreen(),
        'register': (context) => const RegisterScreen(),
        'main': (context) => HomePage(),
        'consejos': (context) => consejosScreen(),
        'alarma': (context) => ConfigurarAlarma(notificationsPlugin: notifications),
      },
    );
  }
}

Future<void> _showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await notifications.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: 'item x',
  );
}
