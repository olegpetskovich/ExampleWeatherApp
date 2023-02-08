import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:weather_app_mycode/const/colors.dart';
import 'package:weather_app_mycode/const/icons.dart';
import 'package:weather_app_mycode/const/styles.dart';
import 'package:weather_app_mycode/presentation/screens/startScreen/start_screen.dart';
import 'package:weather_app_mycode/utils/Utils.dart';

class CityAndHomeButtonPanel extends StatelessWidget {
  const CityAndHomeButtonPanel({
    super.key,
    required this.city
  });

  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.paddingHor15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(city, style: Styles.textPinkLight50),
          IconButton(
            icon: const Image(
              image: Svg(
                icHome,
                size: Size(35, 35),
                color: colorPinkLight,
              ),
            ),
            onPressed: () => Utils.navigate(
                context: context,
                screenWidget: const StartScreen(),
                isClearStack: true),
          ),
        ],
      ),
    );
  }
}
