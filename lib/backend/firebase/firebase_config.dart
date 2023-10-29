import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD7qi_8lteZvvhYWpJQXKIBL821yBf-Swg",
            authDomain: "hocamathbot.firebaseapp.com",
            projectId: "hocamathbot",
            storageBucket: "hocamathbot.appspot.com",
            messagingSenderId: "914846844480",
            appId: "1:914846844480:web:bcc298efe54f2ef2fcc1a5",
            measurementId: "G-Z57LHRGX73"));
  } else {
    await Firebase.initializeApp();
  }
}
