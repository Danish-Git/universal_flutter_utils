import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _handleError(err, () {
      // Retry logic: Pass the retry functionality as needed
      handler.next(err); // Continue with the intercepted error
    });
  }

  void _handleError(DioException error, VoidCallback retryCallback) {
    String title = 'An Error Occurred';
    String message = 'Something went wrong. Please try again.';
    bool showRetry = false;

    // Customize message and actions based on error type
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        title = 'Request Timed Out';
        message = 'It seems the server is taking too long to respond.';
        showRetry = true;
        break;
      case DioExceptionType.badResponse:
      // Handle server errors (like 4xx and 5xx)
        final statusCode = error.response?.statusCode ?? 0;
        message = 'Server error: HTTP $statusCode';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection.';
        break;
      default:
        message = error.message ?? message;
        break;
    }

    // Display error using Get.bottomSheet
    Get.bottomSheet(
      UFUConfirmationDialog(
        title: title,
        subTitle: message,
        type: error.type == DioExceptionType.connectionError ? UFUConfirmationDialogType.alert : UFUConfirmationDialogType.message,
        suffixBtnText: "Retry",
        onTapSuffix: () {
          Get.back();
          retryCallback();
        },
      ),
      // _buildErrorBottomSheet(title, message, showRetry, retryCallback),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

}
