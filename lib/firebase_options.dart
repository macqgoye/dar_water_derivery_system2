import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // Add other platforms if needed
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAFW92cFSHvZriJA2M6rta1MVtZEocBGWg',
    appId: '1:540697026906:web:ec184f6ba75c997473d363',
    messagingSenderId: '540697026906',
    projectId: 'dar-water-delivery-syste-cfcb6',
    authDomain: 'dar-water-delivery-syste-cfcb6.firebaseapp.com',
    storageBucket: 'dar-water-delivery-syste-cfcb6.appspot.com',
    measurementId: 'G-Y43ETMZ69L',
  );
}