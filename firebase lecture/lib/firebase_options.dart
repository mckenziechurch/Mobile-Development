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
    apiKey: 'AIzaSyBTK2mRQv_SF6r6HigDqiMyMG_aDQo_I64',
    appId: '1:1036073964483:web:ce3bab04621f647143a376',
    messagingSenderId: '1036073964483',
    projectId: 'fir-test-ruabng',
    authDomain: 'fir-test-ruabng.firebaseapp.com',
    storageBucket: 'fir-test-ruabng.appspot.com',
    measurementId: 'G-QRMN9GF16Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEKLE2fHWH4m7Bv39dPDukD_LwfN8eLzY',
    appId: '1:1036073964483:android:77622a90012d845043a376',
    messagingSenderId: '1036073964483',
    projectId: 'fir-test-ruabng',
    storageBucket: 'fir-test-ruabng.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjXgAUQd9-AeDrm65utc4PaL1IQ2Hwm18',
    appId: '1:1036073964483:ios:6d2a21a03c8397ef43a376',
    messagingSenderId: '1036073964483',
    projectId: 'fir-test-ruabng',
    storageBucket: 'fir-test-ruabng.appspot.com',
    iosClientId: '1036073964483-u0bcke59f0k8b4ovi2mn1n68onf2fl02.apps.googleusercontent.com',
    iosBundleId: 'com.example.myCustomers',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjXgAUQd9-AeDrm65utc4PaL1IQ2Hwm18',
    appId: '1:1036073964483:ios:6d2a21a03c8397ef43a376',
    messagingSenderId: '1036073964483',
    projectId: 'fir-test-ruabng',
    storageBucket: 'fir-test-ruabng.appspot.com',
    iosClientId: '1036073964483-u0bcke59f0k8b4ovi2mn1n68onf2fl02.apps.googleusercontent.com',
    iosBundleId: 'com.example.myCustomers',
  );
}
