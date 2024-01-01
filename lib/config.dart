import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

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
    apiKey: 'AIzaSyAcVr1p8S-w-zO3EuxGyw94WKNkFbCoXeU',
    appId: '1:35105450802:web:65097e1bf27347f561052b',
    messagingSenderId: '', // Replace with your web messaging sender ID
    projectId: 'localisationui',
    authDomain: 'localisationui.firebaseapp.com',
    storageBucket: 'localisationui.appspot.com',
    measurementId: '',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcVr1p8S-w-zO3EuxGyw94WKNkFbCoXeU',
    appId: '1:35105450802:android:65097e1bf27347f561052b',
    messagingSenderId: 'YOUR_ANDROID_MESSAGING_SENDER_ID', // Replace with your Android messaging sender ID
    projectId: 'localisationui',
    databaseURL: 'https://localisationui-default-rtdb.firebaseio.com/',
    storageBucket: 'localisationui.appspot.com',
  );


}
