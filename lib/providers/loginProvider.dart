import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/response.dart';

class LoginProvider with ChangeNotifier {
  Future<AuthResponse> regester(
      {required String email, required String password}) async {
    try {
      // code used to create an account using email and password
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthResponse(
          messag: "weak-password",
        );
      } else if (e.code == 'email-already-in-use') {
        return AuthResponse(messag: "email-already-in-use");
      }
    } catch (e) {
      return AuthResponse(messag: "$e");
    }

// if successfully created then it we return the user with success messag
    var user =
        FirebaseAuth.instance.currentUser; // code used to get the current user
    return AuthResponse(messag: "sucess", user: user);
  }

  Future<AuthResponse> signIn(
      {required String email, required String password}) async {
    try {
      // code used to login an account using email and password
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthResponse(messag: "user-not-found");
      } else if (e.code == 'wrong-password') {
        return AuthResponse(messag: "wrong-password");
      }
    } catch (e) {
      return AuthResponse(messag: "$e");
    }

// if successfully authenticated then it we return the user with success messag
    var user =
        FirebaseAuth.instance.currentUser; // code used to get the currentUser
    return AuthResponse(messag: "sucess", user: user);
  }
}
