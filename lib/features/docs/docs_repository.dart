import 'package:dio/dio.dart';
import 'package:doks/features/docs/models/document.dart';
import 'package:doks/utils/endpoints.dart';
import 'package:doks/utils/functions.dart';
import 'package:doks/utils/strings.dart';
import 'package:flutter/foundation.dart';

class DocsRepository {
  DocsRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<Doc>> getDocs({required String token}) async {
    try {
      final res = await _dio.get(
        Endpoints.documents,
        options: Options(headers: {Strings.xAuthToken: token}),
      );

      switch (res.statusCode) {
        case 200:
          debugPrint(res.data.toString());
          final data = res.data as List<dynamic>;
          final docs = data.map((e) => Doc.fromJson(e)).toList();
          return docs;
        default:
          showSnackBar('Something went wrong');
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
    return [];
  }

  Future<Doc?> createDoc({required String token}) async {
    try {
      final res = await _dio.post(
        Endpoints.documents,
        data: Doc(createdAt: DateTime.now().millisecondsSinceEpoch).toJson(),
        options: Options(headers: {Strings.xAuthToken: token}),
      );
      debugPrint(res.data.toString());

      switch (res.statusCode) {
        case 200:
          showSnackBar('Document created');
          return Doc.fromJson(res.data);
        case 401:
          showSnackBar('Unauthorized');
          break;
        default:
          showSnackBar('Something went wrong');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }

  Future<Doc> getDoc({required String token, required String id}) async {
    try {
      final res = await _dio.get(
        '${Endpoints.documents}/$id',
        options: Options(headers: {Strings.xAuthToken: token}),
      );
      debugPrint(res.data.toString());

      switch (res.statusCode) {
        case 200:
          return Doc.fromJson(res.data);
        case 401:
          showSnackBar('Unauthorized');
          break;
        case 404:
          showSnackBar('Document not found');
          throw Exception('Document not found');
        default:
          showSnackBar('Something went wrong');
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception('There was an error fetching the document');
    }
    throw Exception('There was an error fetching the document');
  }

  Future<Doc?> updateDoc({
    required String token,
    required Doc doc,
  }) async {
    try {
      debugPrint("DATA: ${doc.toJson()}");
      final res = await _dio.put(
        '${Endpoints.documents}/${doc.id}${Endpoints.documentsTitle}',
        data: doc.toJson(),
        options: Options(headers: {Strings.xAuthToken: token}),
      );
      debugPrint(res.data.toString());
      return Doc.fromJson(res.data);
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
