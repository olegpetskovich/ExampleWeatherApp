import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_mycode/const/path.dart';

class WeatherLottieBg extends StatelessWidget {
  const WeatherLottieBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: Lottie.asset(backgroundPath, fit: BoxFit.fill));
  }
}
