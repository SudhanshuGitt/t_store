// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAukgPMZ36xesHZImRhAdgS9U1RKNSdeYE',
    appId: '1:801660982558:web:2cda42a2b3f3502555650f',
    messagingSenderId: '801660982558',
    projectId: 'tstoreecommerce-90b84',
    authDomain: 'tstoreecommerce-90b84.firebaseapp.com',
    storageBucket: 'tstoreecommerce-90b84.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFVxfqQOLkqk13Szql9BEj4QMmfeEkZv8',
    appId: '1:801660982558:android:95a42fbd1f18488855650f',
    messagingSenderId: '801660982558',
    projectId: 'tstoreecommerce-90b84',
    storageBucket: 'tstoreecommerce-90b84.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0FAY1kOVc61rBi0CPqoncw7rTFZNnrU4',
    appId: '1:801660982558:ios:766c0624ff2105ac55650f',
    messagingSenderId: '801660982558',
    projectId: 'tstoreecommerce-90b84',
    storageBucket: 'tstoreecommerce-90b84.firebasestorage.app',
    androidClientId: '801660982558-67equ9mv2kk382bgvnnge5qucpdbdtmj.apps.googleusercontent.com',
    iosClientId: '801660982558-m5a2d1vhrm4vs4vidhdfp3b0vv6g3aph.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStore',
  );

}