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
    apiKey: 'AIzaSyBugV4VzKGRx5GsqyfgnlprSUu5rFYYX9Y',
    appId: '1:1017348963934:android:33fab2679f462d72243ecf',
    messagingSenderId: '1017348963934',
    projectId: 'fquizres',
    storageBucket: 'fquizres.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdfm88A8HRx9hNkcfi7ROArV0bsuTRVYA',
    appId: '1:1017348963934:ios:1701797ca593989d243ecf',
    messagingSenderId: '1017348963934',
    projectId: 'fquizres',
    storageBucket: 'fquizres.appspot.com',
    androidClientId: '1017348963934-g4ufloo73rreg57ifblql2s09cui2sec.apps.googleusercontent.com',
    iosClientId: '1017348963934-ff72ugbugsuqld97i6ec9fbm5g04unt2.apps.googleusercontent.com',
    iosBundleId: 'com.example.fquizres',
  );
}
