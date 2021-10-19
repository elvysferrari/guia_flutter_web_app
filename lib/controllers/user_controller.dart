import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_flutter_web_app/models/user_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  void signIn() async {
    try {
      //showLoadingLogin();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Login falhou", "Tente novamente");
    }
  }

  void signUp() async {

    try {
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Cadastro falhou", "Tente novamente");
    }
  }

  void signOut() async {

  }
  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

}
