import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  User? user;
  String messag;
  AuthResponse({this.user, required this.messag});
}
