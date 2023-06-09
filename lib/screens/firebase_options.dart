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
    apiKey: 'AIzaSyBBk87pxT7SfVDGffb5tO4Y1gUcH2cuxf4',
    appId: '1:562597886175:web:6660691770a8a360b3916a',
    messagingSenderId: '562597886175',
    projectId: 'fitex-ef7f4',
    authDomain: 'fitex-ef7f4.firebaseapp.com',
    storageBucket: 'fitex-ef7f4.appspot.com',
    measurementId: 'G-J7SVTWVHHZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2XPia75wlxQWwMbfHD-ptjAXO54Ptm3g',
    appId: '1:562597886175:android:ffbf551f2be838d7b3916a',
    messagingSenderId: '562597886175',
    projectId: 'fitex-ef7f4',
    storageBucket: 'fitex-ef7f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRSxd5hcHXoRqB8w98RZ7XwD0YunWzSK4',
    appId: '1:562597886175:ios:34d04b4cff62b719b3916a',
    messagingSenderId: '562597886175',
    projectId: 'fitex-ef7f4',
    storageBucket: 'fitex-ef7f4.appspot.com',
    iosClientId: '562597886175-8ea840dmltf3o0t3lpps17va897g1rm7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRSxd5hcHXoRqB8w98RZ7XwD0YunWzSK4',
    appId: '1:562597886175:ios:34d04b4cff62b719b3916a',
    messagingSenderId: '562597886175',
    projectId: 'fitex-ef7f4',
    storageBucket: 'fitex-ef7f4.appspot.com',
    iosClientId: '562597886175-8ea840dmltf3o0t3lpps17va897g1rm7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitex',
  );
}
