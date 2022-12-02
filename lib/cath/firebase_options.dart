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
    apiKey: 'AIzaSyDek_NTfW_OX2yxRGSV_6RAW0sGLdjdqEc',
    appId: '1:64007077029:web:6f8429146f3e194b76214c',
    messagingSenderId: '64007077029',
    projectId: 'house-1774c',
    authDomain: 'house-1774c.firebaseapp.com',
    storageBucket: 'house-1774c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr0xaigTFCg8QmeVkhy3mbFG_0ztjSCiA',
    appId: '1:64007077029:android:60c073db258dd3b176214c',
    messagingSenderId: '64007077029',
    projectId: 'house-1774c',
    storageBucket: 'house-1774c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1W81AwwoiA8JtXROsGpoH73lJN8S9N4I',
    appId: '1:64007077029:ios:dc5f63031730228c76214c',
    messagingSenderId: '64007077029',
    projectId: 'house-1774c',
    storageBucket: 'house-1774c.appspot.com',
    iosClientId: '64007077029-ast0k9d2tt5daijc37361kcrn8vhmqod.apps.googleusercontent.com',
    iosBundleId: 'com.example.tree',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1W81AwwoiA8JtXROsGpoH73lJN8S9N4I',
    appId: '1:64007077029:ios:dc5f63031730228c76214c',
    messagingSenderId: '64007077029',
    projectId: 'house-1774c',
    storageBucket: 'house-1774c.appspot.com',
    iosClientId: '64007077029-ast0k9d2tt5daijc37361kcrn8vhmqod.apps.googleusercontent.com',
    iosBundleId: 'com.example.tree',
  );
}