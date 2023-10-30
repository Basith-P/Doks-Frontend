import 'package:flutter/foundation.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;

  AuthRepository({required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        debugPrint('User is null');
        return;
      }
      debugPrint(user.email);
      debugPrint(user.displayName);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
