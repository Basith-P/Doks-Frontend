import 'package:doks/features/auth/pages/login_page.dart';
import 'package:doks/features/auth/providers.dart';
import 'package:doks/features/home/page/home_page.dart';
import 'package:doks/utils/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Doks',
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: ref.watch(userAuthStateProvider).when(
            data: (user) => user != null ? const HomePage() : const LoginPage(),
            error: (e, st) => const LoginPage(),
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          ),
    );
  }
}
