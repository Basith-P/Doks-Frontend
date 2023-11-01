import 'package:doks/features/auth/providers.dart';
import 'package:doks/features/docs/providers.dart';
import 'package:doks/utils/loaders.dart';
import 'package:doks/utils/strings.dart';
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
      navigator.push('/${Strings.documents}/${doc.id}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Doks", style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: ref.watch(getDocsProvider).when(
            data: (docs) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getColCount(context),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final doc = docs[index];
                return GestureDetector(
                  onTap: () => goToDOc(context, doc.id!),
                  child: Card(
                    child: Center(child: Text(doc.title ?? 'Untitled')),
                  ),
                );
              },
            ),
            loading: () => loaderPrimary,
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
          ),
    );
  }
}

getColCount(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width > 1200) {
    return 5;
  } else if (width > 800) {
    return 4;
  } else if (width > 600) {
    return 3;
  } else if (width > 400) {
    return 2;
  } else {
    return 1;
  }
}

goToDOc(BuildContext context, String docId) {
  Routemaster.of(context).push('/${Strings.documents}/$docId');
}
