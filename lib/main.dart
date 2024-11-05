import 'package:academia/screens/homeScreens.dart';
import 'package:academia/screens/loginScreens.dart';
import 'package:academia/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routes: {
        //'/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        //'/home': (context) => const Homescreens(),
        '/register': (context) => const RegisterScreen(),
        //'/edit_profile': (context) => const EditProfileScreen(),
        //'/calendar': (context) => const calendarScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter: Primeiros Passos'),
        ), 
        body: LoginScreen()
      ),
    );
  }
}

