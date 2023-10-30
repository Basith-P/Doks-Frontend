import 'package:doks/config/theme/colors.dart';
import 'package:doks/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: ref.read(authRepositoryProvider).signInWithGoogle,
        icon: const Text("G",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        label: const Text("Sign in with Google"),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightGray,
          foregroundColor: AppColors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
