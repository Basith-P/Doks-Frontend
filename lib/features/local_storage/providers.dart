import 'package:doks/features/local_storage/local_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageProvider = Provider((ref) => LocalStorageRepository());
