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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0FwZZm2s8zyr_JFOAlRI2g5lKEO20GH0',
    appId: '1:1017626261470:android:6226d2bbde24c9aa69cf4f',
    messagingSenderId: '1017626261470',
    projectId: 'digitalexppb',
    databaseURL: 'https://digitalexppb-default-rtdb.firebaseio.com',
    storageBucket: 'digitalexppb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpV_0dhhApxrX2f90U-e6Y-PEut3xJdcc',
    appId: '1:1017626261470:ios:4234b92e921f973169cf4f',
    messagingSenderId: '1017626261470',
    projectId: 'digitalexppb',
    databaseURL: 'https://digitalexppb-default-rtdb.firebaseio.com',
    storageBucket: 'digitalexppb.appspot.com',
    androidClientId: '1017626261470-0jfg6p35ihru51avfei3rl2br6fh6q9h.apps.googleusercontent.com',
    iosClientId: '1017626261470-vd0krqssuqqrho9i9ive59lq7l0ffq7f.apps.googleusercontent.com',
    iosBundleId: 'com.example.pruebaTecnica',
  );
}
