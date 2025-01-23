import 'dart:convert';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;

import '../../models/contact.dart';
import 'audio_file_handeling/index.dart';

class UFFilePickerUtil {

  Future<String?> selectDocument() async {

    if (!(await UFUtils.permissionUtils.getStoragePermission())) {
      await permissionDeniedDialogue();
      return null;
    }

    // Pick a file with allowed extensions
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'png',
        'jpg',
        'jpeg'
      ], // Add your desired extensions
    );

    String? filePath;
    if (result != null) {
      filePath = result.files.single.path;
    } else {
      filePath = null;
    }
    return filePath;
  }

  Future<List<XFile>> selectImageFromGallery({bool selectMultiple = false}) async {
    return await _pickImageFile(
      source: ImageSource.gallery,
      compress: true,
      multiple: selectMultiple,
    );
  }

  Future<List<XFile>> captureImageFromCamera({bool selectMultiple = false}) async {

    try {

      if (!(await UFUtils.permissionUtils.getCameraPermission())) {
        await permissionDeniedDialogue();
        return [];
      }

      final value = await _pickImageFile(
        source: ImageSource.camera,
        compress: true,
        multiple: selectMultiple,
      );
      return value;
    } catch (e, stacktrace) {
      rethrow;
    }

  }

  Future<dynamic> recordAudio() async {
    try {
      if (!(await UFUtils.permissionUtils.getMicrophonePermission())) {
        await permissionDeniedDialogue();
        return null;
      }
      return await ShowRecordingDialog();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> selectContacts() async {
    ///   Check contact permission
    if (Platform.isAndroid) {
      if (!(await UFUtils.permissionUtils.getContactsPermission())) {
        await permissionDeniedDialogue();
        return null;
      }
    }

    Contact? selectedContact = await FlutterNativeContactPicker().selectContact();

    if (selectedContact != null) {
      ContactModel? contact = ContactModel.fromContacts(selectedContact);
      return jsonEncode(contact.toJson());
    }
    return null;
  }


  Future<List<XFile>> _pickImageFile({required ImageSource source, bool multiple = false, bool compress = false}) async {
    List<XFile> files = <XFile>[];
    try {
      if (!multiple) {
        final XFile? file = await ImagePicker().pickImage(source: source);
        files.clear();
        if (compress && file != null) {
          final compressedFile = await _compressImage(file);
          files.add(compressedFile);
        } else {
          if (file != null) files.add(file);
        }
      } else {
        final List<XFile> filesX = await ImagePicker().pickMultiImage();
        files.clear();
        files.addAll(filesX);
      }
    } on PlatformException catch (e) {
      rethrow;
    }

    return files;
  }

  Future<XFile> _compressImage(XFile file) async {
    // Read the image from the XFile
    final imageFile = File(file.path);
    final image = img.decodeImage(await imageFile.readAsBytes());

    if (image == null) {
      throw Exception("Failed to decode image.");
    }

    // Resize the image to a smaller size (optional)
    final resizedImage = img.copyResize(image, width: 600);

    // Compress the image
    final compressedImageBytes = img.encodeJpg(resizedImage, quality: 85);

    // Write the compressed image to a new file
    final compressedImagePath = path.join(path.dirname(file.path), 'compressed_${path.basename(file.path)}');
    final compressedImageFile = File(compressedImagePath);
    await compressedImageFile.writeAsBytes(compressedImageBytes);

    // Return the compressed image as XFile
    return XFile(compressedImagePath);
  }

  Future<void> permissionDeniedDialogue() async {
    await showUFUBottomSheet(child: (UFUBottomSheetController controller) => UFUConfirmationDialog(
      title: "Permission Denied",
      subTitle: "This action requires additional permissions. Please enable the necessary permissions in your device settings",
      type: UFUConfirmationDialogType.message,
      suffixBtnText: "Go to Settings",
      onTapSuffix: () async => await openAppSettings(),
    ));
  }

}