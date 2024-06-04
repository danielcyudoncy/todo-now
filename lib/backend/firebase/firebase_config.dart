import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyACyZVbiosTe-9hdLeQMYqJFkB-1wG9U5o",
            authDomain: "todonow-5c308.firebaseapp.com",
            projectId: "todonow-5c308",
            storageBucket: "todonow-5c308.appspot.com",
            messagingSenderId: "351748062132",
            appId: "1:351748062132:web:654dd6076b6490ea9dd0e1"));
  } else {
    await Firebase.initializeApp();
  }
}
