import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDt5RWWBb0Gq5rwsttDhupeEl7Eklt6GZA",
          authDomain: "shopping-83301.firebaseapp.com",
          projectId: "shopping-83301",
          storageBucket: "shopping-83301.appspot.com",
          messagingSenderId: "26699458762",
          appId: "1:26699458762:web:6b6e32cb7cef8ae9b52c33"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
