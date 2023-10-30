import 'package:doks/config/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {},
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
