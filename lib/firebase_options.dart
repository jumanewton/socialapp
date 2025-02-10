import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
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
          'DefaultFirebaseOptions have not been configured for Linux - '
          'reconfigure using the FlutterFire CLI.',
        );
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['WEB_API_KEY'] ?? '',
    appId: '1:563935476070:web:ed5bb12042b462502db0a7',
    messagingSenderId: '563935476070',
    projectId: 'minimal-social-app-6235d',
    authDomain: 'minimal-social-app-6235d.firebaseapp.com',
    storageBucket: 'minimal-social-app-6235d.firebasestorage.app',
    measurementId: 'G-EVEBD0ZETT',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_API_KEY'] ?? '',
    appId: '1:563935476070:android:a2ceea6e05b5a2de2db0a7',
    messagingSenderId: '563935476070',
    projectId: 'minimal-social-app-6235d',
    storageBucket: 'minimal-social-app-6235d.firebasestorage.app',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_API_KEY'] ?? '',
    appId: '1:563935476070:ios:b843b9e8a2052c522db0a7',
    messagingSenderId: '563935476070',
    projectId: 'minimal-social-app-6235d',
    storageBucket: 'minimal-social-app-6235d.firebasestorage.app',
    iosBundleId: 'com.example.socialapp',
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['MACOS_API_KEY'] ?? '',
    appId: '1:563935476070:ios:b843b9e8a2052c522db0a7',
    messagingSenderId: '563935476070',
    projectId: 'minimal-social-app-6235d',
    storageBucket: 'minimal-social-app-6235d.firebasestorage.app',
    iosBundleId: 'com.example.socialapp',
  );

  static FirebaseOptions windows = FirebaseOptions(
    apiKey: dotenv.env['WINDOWS_API_KEY'] ?? '',
    appId: '1:563935476070:web:d440580b1ce582252db0a7',
    messagingSenderId: '563935476070',
    projectId: 'minimal-social-app-6235d',
    authDomain: 'minimal-social-app-6235d.firebaseapp.com',
    storageBucket: 'minimal-social-app-6235d.firebasestorage.app',
    measurementId: 'G-C36WC1K7NJ',
  );
}
