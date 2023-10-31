import 'package:doks/features/docs/docs_repository.dart';
import 'package:doks/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final docsRepositoryProvider =
    Provider((ref) => DocsRepository(dio: ref.watch(dioProvider)));
