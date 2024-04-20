import 'dart:developer';

import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchObjects() async {
    try {
      // final Response response = await _dio.get(const String.fromEnvironment('endpoint'));

      final Response response =
          await _dio.get('https://json-parser.com/f5628f20/4.json');

      final List data = (response.data as Map<String, dynamic>)['payload'];

      final List<Map<String, dynamic>> result =
          data.map((e) => e as Map<String, dynamic>).toList();

      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
