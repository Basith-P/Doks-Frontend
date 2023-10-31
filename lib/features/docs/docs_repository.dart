import 'package:dio/dio.dart';
import 'package:doks/features/docs/models/document.dart';
import 'package:doks/utils/endpoints.dart';
import 'package:doks/utils/functions.dart';
import 'package:doks/utils/strings.dart';
import 'package:flutter/foundation.dart';

class DocsRepository {
  DocsRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  // Future<List<dynamic>> getDocs() async {
  //   try {
  //     final res = await _dio.get(Endpoints.documents);
  //     debugPrint(res.data.toString());

  //     switch (res.statusCode) {
  //       case 200:
  //         List<dynamic> docs = res.data;
  //       // docs.map((e) => Doc)
  //       default:
  //         showSnackBar('Something went wrong');
  //     }
  //   } catch (error) {
  //     debugPrint(error.toString());
  //   }
  //   return [];
  // }

  Future<Document?> createDoc({
    // required Document doc,
    required String token,
  }) async {
    try {
      final res = await _dio.post(
        Endpoints.documents,
        data:
            Document(createdAt: DateTime.now().millisecondsSinceEpoch).toJson(),
        options: Options(headers: {Strings.xAuthToken: token}),
      );
      debugPrint(res.data.toString());

      switch (res.statusCode) {
        case 200:
          showSnackBar('Document created');
          return Document.fromJson(res.data);
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
}
