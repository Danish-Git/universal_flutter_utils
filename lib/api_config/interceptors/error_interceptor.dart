import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _handleError(err, () {
      // Retry logic: Pass the retry functionality as needed
      handler.next(err); // Continue with the intercepted error
    });
  }

  void _handleError(DioError error, VoidCallback retryCallback) {
    String title = 'An Error Occurred';
    String message = 'Something went wrong. Please try again.';
    bool showRetry = false;

    // Customize message and actions based on error type
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
        title = 'Request Timed Out';
        message = 'It seems the server is taking too long to respond.';
        showRetry = true;
        break;
      case DioErrorType.response:
      // Handle server errors (like 4xx and 5xx)
        message = error.response?.statusMessage ?? 'Server error occurred.';
        break;
      case DioErrorType.connectionError:
        message = 'No internet connection.';
        break;
      default:
        message = error.message ?? message;
        break;
    }

    // Display error using Get.bottomSheet
    Get.bottomSheet(
      _buildErrorBottomSheet(title, message, showRetry, retryCallback),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  Widget _buildErrorBottomSheet(
      String title,
      String message,
      bool showRetry,
      VoidCallback retryCallback,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                ),
                child: Text('Close'),
              ),
              if (showRetry)
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Close the bottom sheet
                    retryCallback(); // Trigger retry logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Retry'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
