import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBguS9Iwi01A4UGMbQhfEp6RxKh-Jwzkxo",
            authDomain: "sahi-choice.firebaseapp.com",
            projectId: "sahi-choice",
            storageBucket: "sahi-choice.appspot.com",
            messagingSenderId: "756455656552",
            appId: "1:756455656552:web:fd9471fb2b46436f2a3fdd",
            measurementId: "G-TBH28HZ19D"));
  } else {
    await Firebase.initializeApp();
  }
}
