import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/loginProvider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/screen/add-product/add-product.dart';
import 'package:shopping/screen/home_screen/home_screen.dart';
import 'package:shopping/screen/login/login_screen.dart';
import 'package:shopping/screen/regester/regester_screen.dart';

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
  User? user = FirebaseAuth.instance.currentUser;

  runApp(MyApp(isLogedIn: user == null));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isLogedIn}) : super(key: key);
  bool isLogedIn;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "login": (context) => const LoginScreen(),
          "regester": (context) => const RegesterScreen(),
          "home": (context) => const HomeScreen(),
          "add-product": (context) => const AddProductScreen(),
        },
        initialRoute: isLogedIn ? "home" : "login",
      ),
    );
  }
}
