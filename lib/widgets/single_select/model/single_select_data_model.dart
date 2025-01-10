class UFUSingleSelectModel {

  String? id;
  String? label;
  bool? isSelected;
  dynamic addOnData;

  UFUSingleSelectModel({
    this.id,
    this.label,
    this.isSelected = false,
    this.addOnData
  });
}