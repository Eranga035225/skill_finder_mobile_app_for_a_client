import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:skill_finder/screens/auth_screen.dart';
import 'package:skill_finder/utils/custom_dialogs.dart';

class AuthController {
  Future<User?> createUserAccount({
    required String email,
    required String password,
    required String role,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password' && context.mounted) {
        CustomDialogs.showErrorSnackBar(
          context,
          'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use' && context.mounted) {
        CustomDialogs.showErrorSnackBar(
          context,
          'The account already exists for that email.',
        );
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<User?> signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

        final role = snapshot['role'];

        Logger().d("User Role: $role");
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        CustomDialogs.showErrorSnackBar(
          context,
          'Please Check your email & password',
        );
      }
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }
}
