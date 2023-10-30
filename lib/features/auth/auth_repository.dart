import 'package:dio/dio.dart';
import 'package:doks/features/auth/models/user.dart';
import 'package:doks/utils/endpoints.dart';
import 'package:doks/utils/functions.dart';
import 'package:doks/utils/strings.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository({
    required GoogleSignIn googleSignIn,
    required Dio dio,
  })  : _googleSignIn = googleSignIn,
        _dio = dio;

  final GoogleSignIn _googleSignIn;
  final Dio _dio;

  Future<User?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        debugPrint('User is null');
        return null;
      }
      debugPrint('USER: ${account.email}');
      // final googleKey = await account.authentication;
      final user = User(
        email: account.email,
        name: account.displayName!,
        profilePic: account.photoUrl!,
      );
      final res = await _dio.post(Endpoints.register, data: user.toJson());
      debugPrint(res.data[Strings.user].toString());

      switch (res.statusCode) {
        case 201:
          return User.fromJson(res.data[Strings.user]);
        case 409:
          showSnackBar('User already exists');
          break;
        default:
          showSnackBar('Something went wrong');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
