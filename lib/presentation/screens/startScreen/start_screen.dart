import 'package:flutter/material.dart';
import 'package:weather_app_mycode/presentation/screens/startScreen/widgets/cities_dropdown_button.dart';
import 'package:weather_app_mycode/presentation/widgets/weather_lottie_bg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          WeatherLottieBg(),
          CitiesDropdownButton(),
        ],
      ),
    );
  }
}
