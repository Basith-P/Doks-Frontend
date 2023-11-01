import 'package:doks/features/auth/providers.dart';
import 'package:doks/features/docs/docs_repository.dart';
import 'package:doks/features/docs/models/document.dart';
import 'package:doks/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final docsRepositoryProvider =
    Provider((ref) => DocsRepository(dio: ref.watch(dioProvider)));

final getDocsProvider = FutureProvider<List<Document>>((ref) async {
  final docs = await ref
      .read(docsRepositoryProvider)
      .getDocs(token: ref.read(userProvider)!.token!);
  return docs;
});
