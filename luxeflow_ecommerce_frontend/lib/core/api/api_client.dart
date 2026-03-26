import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5001/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  final _storage = const FlutterSecureStorage();

  ApiClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          debugPrint('API Error: ${e.response?.data}');
          return handler.next(e);
        },
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'jwt_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> post(String path, dynamic data) {
    return dio.post(path, data: data);
  }

  Future<Response> get(String path) {
    return dio.get(path);
  }
}
