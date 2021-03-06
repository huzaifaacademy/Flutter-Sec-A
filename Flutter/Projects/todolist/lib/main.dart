import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/provider/google_sign_in.dart';
import 'package:todolist/screens/email_verify/email_verify.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("activeName");
  late Widget home;
  if (name == null) {
    home = const SplashScreen();
  } else {
    if (await checkEmailVerified()) {
      home = Home(name: name);
    } else {
      home = EmailVerification(name: name);
    }
  }
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: home),
  ));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home,
      ),
    );
  }
}
