import 'package:doks/features/auth/providers.dart';
import 'package:doks/features/docs/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).state = null;
  }

  void createDoc(BuildContext context, WidgetRef ref) async {
    final navigator = Routemaster.of(context);
    final doc = await ref.read(docsRepositoryProvider).createDoc(
          // doc: const Document(
          //   content: [],
          // ),
          token: ref.read(userProvider)!.token!,
        );
    if (doc != null) {
      navigator.push('/docs/${doc.id}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => createDoc(context, ref),
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
