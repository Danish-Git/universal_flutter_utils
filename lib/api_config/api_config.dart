import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class UFApiConfig {
  final Dio _dio = Dio();

  UFApiConfig() {
    _dio.options
      ..baseUrl = UFUtils.baseUrl
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
      final response = await _dio.get(UFUtils.baseUrl + path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Unified POST request
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(UFUtils.baseUrl + path, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Upload file method
  Future<Response> uploadFile({required String path, required File file, Map<String, dynamic>? data,}) async {
    try {
      String fileName = file.path.split('/').last;

      // Create FormData with the file
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
        if (data != null) ...data, // Add any additional data if needed
      });

      // Send POST request with FormData
      Response response = await _dio.post(path, data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data",}),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> downloadFile({required String url, Function(double progress)? onProgress,}) async {
    try {
      // Determine the download directory based on the platform
      final Directory? downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = Directory("/storage/emulated/0/Download");
      } else {
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      // Create a subdirectory for the app's files
      final Directory appDir = Directory("${downloadsDir.path}/myApp");
      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      // Generate the file path
      final String fileName = url.split('/').last;
      final String filePath = "${appDir.path}/$fileName";

      // Download file using Dio
      await _dio.download(url, filePath,
        options: Options(
          headers: {
            "Content-Type": "*/*",
            "Accept": "*/*",
          },
        ),
        onReceiveProgress: (received, total) {
          if (total != -1 && onProgress != null) {
            // Calculate and pass progress percentage
            onProgress((received / total) * 100);
          }
        },
      );

      // Return success response
      return filePath;
    } catch (e) {
      rethrow;
    }
  }

}
