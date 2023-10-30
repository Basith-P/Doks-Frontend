import 'package:doks/features/auth/auth_repository.dart';
import 'package:doks/features/auth/models/user.dart';
import 'package:doks/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInProvider = Provider((_) => GoogleSignIn());

final authRepositoryProvider = Provider((ref) => AuthRepository(
      googleSignIn: ref.watch(googleSignInProvider),
      dio: ref.watch(dioProvider),
    ));

final userProvider = StateProvider<User?>((_) => null);
