class DropdownModel {
  String id;
  String? type;
  String? slug;
  String value;
  String? description;

  DropdownModel({
    required this.id,
    this.slug,
    this.type,
    required this.value,
    this.description,
  });
}
