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
    apiKey: 'AIzaSyAuCqe0z_0vzSM5xCINiwn76d74eo1wrdo',
    appId: '1:268878329535:web:155e1ac2b981bb3a38380a',
    messagingSenderId: '268878329535',
    projectId: 'todo-d7258',
    authDomain: 'todo-d7258.firebaseapp.com',
    storageBucket: 'todo-d7258.firebasestorage.app',
    measurementId: 'G-JTSJGGSXJ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCProUWsyCoK45WZqlx_W8ZZsR67E38Ys',
    appId: '1:268878329535:android:58eeeaa6f2eb881f38380a',
    messagingSenderId: '268878329535',
    projectId: 'todo-d7258',
    storageBucket: 'todo-d7258.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1PXOemHg4TSeZptVkwMpe40jz302ZVvQ',
    appId: '1:268878329535:ios:cc135cc4dbd7e27d38380a',
    messagingSenderId: '268878329535',
    projectId: 'todo-d7258',
    storageBucket: 'todo-d7258.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1PXOemHg4TSeZptVkwMpe40jz302ZVvQ',
    appId: '1:268878329535:ios:cc135cc4dbd7e27d38380a',
    messagingSenderId: '268878329535',
    projectId: 'todo-d7258',
    storageBucket: 'todo-d7258.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAuCqe0z_0vzSM5xCINiwn76d74eo1wrdo',
    appId: '1:268878329535:web:ca587c16ae95dfc938380a',
    messagingSenderId: '268878329535',
    projectId: 'todo-d7258',
    authDomain: 'todo-d7258.firebaseapp.com',
    storageBucket: 'todo-d7258.firebasestorage.app',
    measurementId: 'G-C9RHXFLCTV',
  );
}
