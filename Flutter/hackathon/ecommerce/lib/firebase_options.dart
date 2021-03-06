// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCUAzQ_0ztrWoxEkoPZG4Q4NPVduWjZx3M',
    appId: '1:557138132108:web:294c38b79af83baf000fa9',
    messagingSenderId: '557138132108',
    projectId: 'ecommerce4948',
    authDomain: 'ecommerce4948.firebaseapp.com',
    storageBucket: 'ecommerce4948.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBa05mspGLBhNCR7K8YQj_Z4ymboj20NdY',
    appId: '1:557138132108:android:dba63cd573235daa000fa9',
    messagingSenderId: '557138132108',
    projectId: 'ecommerce4948',
    storageBucket: 'ecommerce4948.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNvnGX9JdCtApfO8KE9Vno08QXKqCx2K8',
    appId: '1:557138132108:ios:d48d556d54d8d968000fa9',
    messagingSenderId: '557138132108',
    projectId: 'ecommerce4948',
    storageBucket: 'ecommerce4948.appspot.com',
    iosClientId: '557138132108-idsc344nib9a21pvbfh5kk7k32mdjih1.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNvnGX9JdCtApfO8KE9Vno08QXKqCx2K8',
    appId: '1:557138132108:ios:d48d556d54d8d968000fa9',
    messagingSenderId: '557138132108',
    projectId: 'ecommerce4948',
    storageBucket: 'ecommerce4948.appspot.com',
    iosClientId: '557138132108-idsc344nib9a21pvbfh5kk7k32mdjih1.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
