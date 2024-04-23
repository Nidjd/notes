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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCmMkIF3cXePdPf8vQd5lGmKJWT35ookow',
    appId: '1:38276384514:web:587d06b38cd604b4d6241b',
    messagingSenderId: '38276384514',
    projectId: 'note-a8701',
    authDomain: 'note-a8701.firebaseapp.com',
    storageBucket: 'note-a8701.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvDcscYPtV_e1Z_HAh1n-fynF-7RlbpS4',
    appId: '1:38276384514:android:73604a26e1daf430d6241b',
    messagingSenderId: '38276384514',
    projectId: 'note-a8701',
    storageBucket: 'note-a8701.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDu08F_qS7BnGsV_EKQMtql5NHTbcrqGb8',
    appId: '1:38276384514:ios:ad6f252309c846edd6241b',
    messagingSenderId: '38276384514',
    projectId: 'note-a8701',
    storageBucket: 'note-a8701.appspot.com',
    androidClientId: '38276384514-hrspiccrnnd0dle5b2lmqqi0qcd74b1q.apps.googleusercontent.com',
    iosClientId: '38276384514-39t9ag5utk9i3uhu5u4212t4ptfdn537.apps.googleusercontent.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDu08F_qS7BnGsV_EKQMtql5NHTbcrqGb8',
    appId: '1:38276384514:ios:ad6f252309c846edd6241b',
    messagingSenderId: '38276384514',
    projectId: 'note-a8701',
    storageBucket: 'note-a8701.appspot.com',
    androidClientId: '38276384514-hrspiccrnnd0dle5b2lmqqi0qcd74b1q.apps.googleusercontent.com',
    iosClientId: '38276384514-39t9ag5utk9i3uhu5u4212t4ptfdn537.apps.googleusercontent.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCmMkIF3cXePdPf8vQd5lGmKJWT35ookow',
    appId: '1:38276384514:web:576ac4a1d9c557e4d6241b',
    messagingSenderId: '38276384514',
    projectId: 'note-a8701',
    authDomain: 'note-a8701.firebaseapp.com',
    storageBucket: 'note-a8701.appspot.com',
  );
}