import 'package:flutter/material.dart';
import 'package:weather_app_mycode/const/styles.dart';

class TemperatureInfo extends StatelessWidget {
  const TemperatureInfo({Key? key, required this.temp, required this.description}) : super(key: key);

  final String temp;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.paddingHor15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(temp,
                  style: Styles.textBrownDark80),
              Text(description,
                  textAlign: TextAlign.start,
                  style: Styles.textViolet25),
            ],
          ),
        ],
      ),
    );
  }
}
