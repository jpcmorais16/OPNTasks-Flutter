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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBSIXdNG8iQ_hZdJXvcJ7pisKBISjh8nsk',
    appId: '1:12359298351:web:b2bfaf1545c06259e305da',
    messagingSenderId: '12359298351',
    projectId: 'opn-tasks',
    authDomain: 'opn-tasks.firebaseapp.com',
    storageBucket: 'opn-tasks.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7jhwjbv3uDB4O-P5qwU93iz2HJSkG5BA',
    appId: '1:12359298351:android:e67f0dcee551a010e305da',
    messagingSenderId: '12359298351',
    projectId: 'opn-tasks',
    storageBucket: 'opn-tasks.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU0jkdgQhgznhsSOFJBVcDmgR5LzDeXqQ',
    appId: '1:12359298351:ios:a0aa6cb97f25b694e305da',
    messagingSenderId: '12359298351',
    projectId: 'opn-tasks',
    storageBucket: 'opn-tasks.appspot.com',
    iosClientId: '12359298351-t58qvroapk4h5pie7no2tqe9lii3gtj2.apps.googleusercontent.com',
    iosBundleId: 'com.example.opnFlutter',
  );
}