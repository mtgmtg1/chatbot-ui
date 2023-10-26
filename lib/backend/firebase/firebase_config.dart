import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWAaLbCUbXxmS9V656iHTBEEcwyS3fcqo",
            authDomain: "pdfwithhoca.firebaseapp.com",
            projectId: "pdfwithhoca",
            storageBucket: "pdfwithhoca.appspot.com",
            messagingSenderId: "121048195883",
            appId: "1:121048195883:web:cc94fb27dddb6611385b6e"));
  } else {
    await Firebase.initializeApp();
  }
}
