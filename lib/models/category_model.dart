class CategoryModel {

  late int id;
  late String type;
  late String name;
  late String? description;
  late String urlImage;
  late bool bActive;
  late int sortOrder;

  CategoryModel({
    required this.id,
    required this.type,
    required this.name,
    this.description,
    required this.urlImage,
    required this.bActive,
    required this.sortOrder
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "urlImage": urlImage,
    "description" : description,
    "bActive" : bActive,
    "sortOrder" : sortOrder
  };

  CategoryModel.fromMap(Map<String, dynamic> json){
    id = json["id"] ?? 0;
    name = json["name"] ?? "";
    type = json["type"] ?? "";
    urlImage =json["urlImage"] ?? "";
    description = json["description"] ?? "";
    sortOrder =  json["sortOrder"] ?? 0;
    bActive = json["bActive"] ?? false;
  }
}
