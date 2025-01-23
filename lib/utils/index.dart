import 'package:flutter/cupertino.dart';
import 'package:universal_flutter_utils/utils/app_config/index.dart';

import 'date_time/index.dart';
import 'file_picker/index.dart';
import 'form_validator/index.dart';
import 'permissions/index.dart';
import 'shared_preferences/index.dart';

class UFUtils {
  static String appName = UFUAppConfig.appName;
  static String baseUrl = UFUAppConfig.baseUrl;
  static String socketBaseUrl = UFUAppConfig.socketBaseUrl;

  ///   Form Validations
  static String? emailValidator(String? value, {bool isRequired = true}) => FormValidator.emailValidator(value, isRequired: isRequired);
  static String? passwordValidator(String? value, {bool isRequired = true}) => FormValidator.passwordValidator(value, isRequired: isRequired);
  static String? phoneValidator(String? value, {bool isRequired = true}) => FormValidator.phoneValidator(value, isRequired: isRequired);
  static String? textValidator(String? value, {bool isRequired = true}) => FormValidator.textValidator(value, isRequired: isRequired);

  ///   Date-Time Formatting
  static String? formatDate(DateTime dateTime, {String format = 'yyyy-MM-dd'}) => DateTimeUtils.formatDate(dateTime, format: format);
  static String? formatTime(DateTime dateTime, {String format = 'hh:mm a'}) => DateTimeUtils.formatTime(dateTime, format: format);
  static String? formatCompleteDateTime(DateTime dateTime, {String format = 'yyyy-MM-dd hh:mm a'}) => DateTimeUtils.formatCompleteDateTime(dateTime, format: format);
  static String? timeAgo(DateTime dateTime) => DateTimeUtils.timeAgo(dateTime);
  static String? dayWishes() => DateTimeUtils.dayWishes();
  static DateTime? parseDate(String dateString, {String format = 'yyyy-MM-dd'}) => DateTimeUtils.parseDate(dateString, format: format);
  static DateTime? parseTime(String timeString, {String format = 'hh:mm a'}) => DateTimeUtils.parseTime(timeString, format: format);
  static DateTime? parseCompleteDateTime(String completeDateTimeString, {String format = 'yyyy-MM-dd hh:mm a'}) => DateTimeUtils.parseCompleteDateTime(completeDateTimeString, format: format);

  ///   Permission Handling
  static UFPermissionUtils permissionUtils = UFPermissionUtils();

  ///   Shared Preferences Handling
  static UFPrefUtils preferences = UFPrefUtils();

  ///   Storage Max File Size
  static int maxAllowedFileSize = 52428800; // Size is in bytes
  static int singleAttachmentMaxSize = 10 * 1024 * 1024; // 10MB
  static int totalAttachmentMaxSize = 20 * 1024 * 1024; // 20MB
  static bool restrictFolderStructure = true;

  ///   Animation Transition Duration
  static const int transitionDuration = 150;

  static UFFilePickerUtil picker = UFFilePickerUtil();

}