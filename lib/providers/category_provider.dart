import 'dart:convert';
import 'dart:async' show Future;

import 'package:flutter/services.dart' show rootBundle;
import 'package:guia_flutter_web_app/models/category_model.dart';

Future<List<CategoryModel>> getAllCategories() async {
  List<dynamic> list = json.decode(await getJsonCategories());
  List<CategoryModel> categories = list.map((item) => CategoryModel.fromMap(item)).toList();
  return categories;
}

Future<String> getJsonCategories() async {
  return rootBundle.loadString('assets/guia_comercial_categorias.json');
}
