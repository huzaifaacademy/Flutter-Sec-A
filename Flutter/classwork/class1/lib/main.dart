import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setStringList('emails', ['test@test.com']);
  // await prefs.setStringList('passwords', ['123']);
  final List<String>? items = prefs.getStringList('items');
  String? active = prefs.getString("active");
  runApp((active == null) ? MyApp() : Home());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
