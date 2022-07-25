import 'package:flutter/material.dart';

extension ProjectColors on Colors {
  
  static const Color backgroundMain = Color(0xff080A0C);

  static const LinearGradient startScreenGradient = LinearGradient(colors: [
    Color(0xff8AD4EC),
    Color(0xffEF96FF),
    Color(0xffFF56A9),
    Color(0xffFFAA6C),

  ]);

  static const LinearGradient whiteGradient = LinearGradient(colors: [Colors.white, Colors.white]);

  static const Color noneSelectedCircle = Color(0xff384657);
  static const Color selectedCircle = Color(0xff3D8DFF);
  static const Color gray21 = Color(0xff202832);
}