import 'package:dio/dio.dart';
import 'package:doks/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((_) => Dio(
      BaseOptions(
        baseUrl: kApiBaseUrl,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    ));
