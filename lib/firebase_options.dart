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
    apiKey: 'AIzaSyCPD5q7TzOknzf6TquQg1vY1XZhKPhLF6o',
    appId: '1:302337295701:web:c23eeb15a082a888415bdc',
    messagingSenderId: '302337295701',
    projectId: 'kibtask',
    authDomain: 'kibtask.firebaseapp.com',
    storageBucket: 'kibtask.appspot.com',
    measurementId: 'G-KC6W9SY2ZQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDekFSVj72MVpkdPBSaY0eU1vP2XPgqQgU',
    appId: '1:302337295701:android:6d909290daa4b7a2415bdc',
    messagingSenderId: '302337295701',
    projectId: 'kibtask',
    storageBucket: 'kibtask.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDs5P2Utt0HOQ1lIP_hqox8GriplEjUdxc',
    appId: '1:302337295701:ios:6d89156f25e77a76415bdc',
    messagingSenderId: '302337295701',
    projectId: 'kibtask',
    storageBucket: 'kibtask.appspot.com',
    iosClientId: '302337295701-9qag8cm195filt0ibqvpkedtn0vf0uro.apps.googleusercontent.com',
    iosBundleId: 'com.example.kibTask',
  );
}
