import 'package:get/get.dart';

import '../bottom_sheet/controller.dart';
import 'model/single_select_data_model.dart';

class UFUSingleSelectController extends GetxController {

  final UFUBottomSheetController? bottomSheetController;

  List<UFUSingleSelectModel>? dataList = [];

  UFUSingleSelectController({this.bottomSheetController, this.dataList});
}