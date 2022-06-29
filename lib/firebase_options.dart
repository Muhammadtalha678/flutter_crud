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
    apiKey: 'AIzaSyAvou-LAE4kAQfxKCDRRKXw4zPL4NAggrA',
    appId: '1:753103510817:web:c33d91afa8e5951b9d7260',
    messagingSenderId: '753103510817',
    projectId: 'crudflutter-ed3ed',
    authDomain: 'crudflutter-ed3ed.firebaseapp.com',
    storageBucket: 'crudflutter-ed3ed.appspot.com',
    measurementId: 'G-VDB4NE7JE6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfkYB57Mix-5z1HNByA4gFHXkUHvkFE5M',
    appId: '1:753103510817:android:ab23073be66573f99d7260',
    messagingSenderId: '753103510817',
    projectId: 'crudflutter-ed3ed',
    storageBucket: 'crudflutter-ed3ed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuSfAGmmgO2UNVm7fUsEnBM84Fvt9_a9A',
    appId: '1:753103510817:ios:3ebb375c15130ec39d7260',
    messagingSenderId: '753103510817',
    projectId: 'crudflutter-ed3ed',
    storageBucket: 'crudflutter-ed3ed.appspot.com',
    iosClientId: '753103510817-6v9kkepmlnhk0rj0ig78pjte809trhmd.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasecrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuSfAGmmgO2UNVm7fUsEnBM84Fvt9_a9A',
    appId: '1:753103510817:ios:3ebb375c15130ec39d7260',
    messagingSenderId: '753103510817',
    projectId: 'crudflutter-ed3ed',
    storageBucket: 'crudflutter-ed3ed.appspot.com',
    iosClientId: '753103510817-6v9kkepmlnhk0rj0ig78pjte809trhmd.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasecrud',
  );
}