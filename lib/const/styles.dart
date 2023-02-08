import 'package:flutter/material.dart';
import 'package:weather_app_mycode/const/colors.dart';

class Styles {
  static TextStyle textPinkLight = const TextStyle(color: colorPinkLight);

  static TextStyle textPinkLight25 =
      const TextStyle(color: colorPinkLight, fontSize: 25);

  static TextStyle textPinkLight50 =
      const TextStyle(color: colorPinkLight, fontSize: 50);

  static TextStyle textViolet25 =
      const TextStyle(color: colorViolet, fontSize: 25);

  static TextStyle textBrownDark80 =
      const TextStyle(color: colorBrownDark, fontWeight: FontWeight.bold, fontSize: 80);

  static EdgeInsets paddingHor40 = const EdgeInsets.symmetric(horizontal: 40);
  static EdgeInsets paddingHor15 = const EdgeInsets.symmetric(horizontal: 15);
  static EdgeInsets paddingHor20Ver5 = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );

  static BoxDecoration boxRounded40ColorAppMain = BoxDecoration(
    color: colorBrownDark,
    borderRadius: BorderRadius.circular(40),
  );
}
