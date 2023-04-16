import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tesis/Src/consejos.dart';
import 'package:tesis/Src/login_screen.dart';
import 'package:tesis/Src/principal_screen.dart';
import 'package:tesis/Src/register_screen.dart';
import 'dart:io';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: { 
        'login':(context) =>  const Loginscreen(),
        'register' : (context) => const RegisterScreen(),
        'main' :(context) =>  HomePage(),
        'consejos' : (context) =>consejosScreen(),
        },
    );

  }
}
