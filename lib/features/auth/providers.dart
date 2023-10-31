import 'package:doks/features/auth/auth_repository.dart';
import 'package:doks/features/auth/models/user.dart';
import 'package:doks/features/local_storage/providers.dart';
import 'package:doks/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInProvider = Provider((_) => GoogleSignIn());

final authRepositoryProvider = Provider((ref) => AuthRepository(
      googleSignIn: ref.watch(googleSignInProvider),
      dio: ref.watch(dioProvider),
      localStorageRepository: ref.watch(localStorageProvider),
    ));

final userProvider = StateProvider<User?>((_) => null);

final userAuthStateProvider = FutureProvider<User?>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  final user = await authRepository.getUserData();
  if (user != null) ref.read(userProvider.notifier).state = user;
  return user;
});
