import 'package:doks/config/theme/colors.dart';
import 'package:doks/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  void signIn(WidgetRef ref, BuildContext context) async {
    final navigator = Routemaster.of(context);
    final user = await ref.read(authRepositoryProvider).signInWithGoogle();
    if (user != null) {
      debugPrint('USER: ${user.name}');
      ref.read(userProvider.notifier).state = user;
      navigator.replace('/');
    } else {
      debugPrint('User is null');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signIn(ref, context),
          icon: const Text("G",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          label: const Text("Sign in with Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightGray,
            foregroundColor: AppColors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ),
      ),
    );
  }
}
