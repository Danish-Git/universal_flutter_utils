import 'dart:io';
import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Check internet connection
    bool isConnected = await _checkInternetConnection();
    if (!isConnected) {
      return handler.reject(
        DioError(
          requestOptions: options,
          error: 'No Internet connection',
          type: DioErrorType.connectionError,
        ),
      );
    }

    // Add headers
    options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE';
    print('Request: ${options.method} ${options.path}');
    return handler.next(options);
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
