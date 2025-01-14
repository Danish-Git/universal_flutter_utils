import 'package:file_picker/file_picker.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UFFilePickerUtil {

  Future<void> selectDocument() async {

    if (!(await UFUtils.permissionUtils.getStoragePermission())) {

      // UFUBottomSheet(childBuilder: (controller) => Column(
      //   children: [
      //     UFUText(text: "text"),
      //     Row(
      //       children: [
      //         Flexible(
      //           flex: 1,
      //           child: UFUButton(),
      //         )
      //       ],
      //     )
      //   ],
      // ));

      // await apiService.handleError(CustomException('pleaseProvideStoragePermission'.tr, 800));
      return;
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

    String? mFile;
    if (result != null) {
      mFile = result.files.single.path;
    } else {
      mFile = null;
    }
  }
}