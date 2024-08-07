import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  Future GoogleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  bool isAdmin(String email) {
    if (email == '6431501118@lamduan.mfu.ac.th') {
      return true;
    } else {
      return false;
    }
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
