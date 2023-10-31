import 'package:dio/dio.dart';
import 'package:doks/features/auth/models/user.dart';
import 'package:doks/features/local_storage/local_storage_repository.dart';
import 'package:doks/utils/endpoints.dart';
import 'package:doks/utils/functions.dart';
import 'package:doks/utils/strings.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository({
    required GoogleSignIn googleSignIn,
    required Dio dio,
    required LocalStorageRepository localStorageRepository,
  })  : _googleSignIn = googleSignIn,
        _dio = dio,
        _localStorageRepository = localStorageRepository;

  final GoogleSignIn _googleSignIn;
  final Dio _dio;
  final LocalStorageRepository _localStorageRepository;

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
        name: account.displayName ?? account.email.split('@')[0],
        profilePic: account.photoUrl ?? '',
      );
      final res = await _dio.post(Endpoints.register, data: user.toJson());
      debugPrint(res.data.toString());

      switch (res.statusCode) {
        case 200:
          User user = User.fromJson(res.data[Strings.user])
              .copyWith(token: res.data[Strings.token]);
          await _localStorageRepository.setToken(user.token!);
          return user;
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

  Future<User?> getUserData() async {
    try {
      final token = await _localStorageRepository.getToken();
      if (token == null) {
        debugPrint('Token is null');
        return null;
      }

      final res = await _dio.get(
        Endpoints.user,
        options: Options(
          headers: {Strings.xAuthToken: token},
        ),
      );

      switch (res.statusCode) {
        case 200:
          User user =
              User.fromJson(res.data[Strings.user]).copyWith(token: token);
          return user;
        case 401:
          showSnackBar('Token expired');
          break;
        default:
          showSnackBar('Something went wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _localStorageRepository.deleteToken();
  }
}
