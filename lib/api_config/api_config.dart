import 'package:dio/dio.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class UFApiConfig {
  final Dio _dio = Dio();

  UFApiConfig() {
    _dio.options
      ..baseUrl = 'https://api.example.com'
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    // Add interceptors
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  // Unified GET request
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Unified POST request
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
