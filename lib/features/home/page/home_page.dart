import 'package:doks/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).state = null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
          IconButton(
            onPressed: () => signOut(ref),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
          child: Text(
        ref.watch(userProvider)?.name ?? "No name",
      )),
    );
  }
}
