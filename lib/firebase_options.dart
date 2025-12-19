import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError('Platform not supported');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7Z_uYAWqg3EpJjk1kvqczyi3ygVywBo0',
    appId: '1:628468402502:android:a39ceece9b875a2fc33d47',
    messagingSenderId: '628468402502',
    projectId: 'notepases-1c53a',
    storageBucket: 'notepases-1c53a.firebasestorage.app',
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSy...',
    appId: '1:1234567890:ios:def456',
    messagingSenderId: '1234567890',
    projectId: 'my-project-id',
    iosBundleId: 'com.company.app',
  );
}
