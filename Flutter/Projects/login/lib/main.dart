import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/home_1.dart';
import 'package:login/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      home: Login(),
=======
      home: Home1(),
>>>>>>> 93bed63b7d9beceb15b7e8dc350571ef643451e9
      debugShowCheckedModeBanner: false,
    );
  }
}
