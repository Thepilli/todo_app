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
    apiKey: 'AIzaSyB2XCf8C7fg2a67P43NDriRSRFpHT4GtZ4',
    appId: '1:386477766090:web:9aa06d60fe1c7efecf4b33',
    messagingSenderId: '386477766090',
    projectId: 'todo-app-dc7d0',
    authDomain: 'todo-app-dc7d0.firebaseapp.com',
    storageBucket: 'todo-app-dc7d0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm5zfEAYVGzL70u0qd6oJDhIGStYfzwO0',
    appId: '1:386477766090:android:3514c21d9b0e434dcf4b33',
    messagingSenderId: '386477766090',
    projectId: 'todo-app-dc7d0',
    storageBucket: 'todo-app-dc7d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_p33LiJfNVNrpDhHm3C5jMWwcMonXOhw',
    appId: '1:386477766090:ios:66abba5c5db2d962cf4b33',
    messagingSenderId: '386477766090',
    projectId: 'todo-app-dc7d0',
    storageBucket: 'todo-app-dc7d0.appspot.com',
    androidClientId: '386477766090-cgsc3gee0q1u2hgrn30irv91u77jh2us.apps.googleusercontent.com',
    iosClientId: '386477766090-rd5nhur6s8mcm9csae6v9h1uodmd2n6n.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_p33LiJfNVNrpDhHm3C5jMWwcMonXOhw',
    appId: '1:386477766090:ios:f3080996d83ad52dcf4b33',
    messagingSenderId: '386477766090',
    projectId: 'todo-app-dc7d0',
    storageBucket: 'todo-app-dc7d0.appspot.com',
    androidClientId: '386477766090-cgsc3gee0q1u2hgrn30irv91u77jh2us.apps.googleusercontent.com',
    iosClientId: '386477766090-4ib5d7t0i0vgbj333h1qm4c07botjen4.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
