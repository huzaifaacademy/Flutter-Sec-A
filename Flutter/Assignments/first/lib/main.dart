import 'package:first/constants/user_constants.dart';
import 'package:first/screens/balance.dart';
import 'package:first/screens/intro.dart';
import 'package:first/screens/notifications.dart';
import 'package:first/screens/profile.dart';
import 'package:first/screens/receive_money.dart';
import 'package:first/screens/splash.dart';
import 'package:first/screens/tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userConstants = UserConstants();
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(scaffoldBackgroundColor: userConstants.theme),
      debugShowCheckedModeBanner: false,
    );
  }
}
