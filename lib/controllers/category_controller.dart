import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_flutter_web_app/models/category_model.dart';
import 'package:guia_flutter_web_app/providers/category_provider.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  List<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future getCategories() async {
    var list = await getAllCategories();
    categories.clear();
    for (var category in list) {
      categories.add(category);
    }
  }


}