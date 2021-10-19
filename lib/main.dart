
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_flutter_web_app/screens/initial_screen.dart';

import 'controllers/app_controller.dart';
import 'controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController());
  Get.put(AppController());

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guia Comercial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: InitialScreen()),
    );
  }
}