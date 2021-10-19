import 'package:flutter/material.dart';

class AppColors{
  static const Color primary = Colors.green;
  static const Color secondary = Colors.grey;
  static const Color blue = Color(0xFF1777F2);
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color textBlack = Colors.black;

  static const LinearGradient degradeHistory = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black54]
  );

}