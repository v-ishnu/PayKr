import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final _auth = FirebaseAuth.instance;


  /*-------------------------------Email & Password SignIn -----------------------------*/

  /// [Authentication] - Register ----------------------------------------------
  Future<User?> createUserWithEmailAndPassword(
      String email,
      String password
      ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }


  /// [Authentication] - Forget ------------------------------------------------
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  /// [Authentication] - LogOut ------------------------------------------------
  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}





