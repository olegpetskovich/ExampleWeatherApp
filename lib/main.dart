import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app_mycode/generated/l10n.dart';
import 'package:weather_app_mycode/presentation/screens/startScreen/start_screen.dart';
import 'package:weather_app_mycode/presentation/screens/weatherScreen/weather_screen.dart';
import 'package:weather_app_mycode/utils/shared_preference.dart';

void main() => runApp(const WeatherAppWidget());

class WeatherAppWidget extends StatefulWidget {
  const WeatherAppWidget({Key? key}) : super(key: key);

  @override
  State<WeatherAppWidget> createState() => _WeatherAppWidgetState();
}

class _WeatherAppWidgetState extends State<WeatherAppWidget> {
  bool _isCitySelected = false;

  @override
  void initState() {
    super.initState();
    _loadPrefValue();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => S.of(context).app_name,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: _isCitySelected ? const WeatherScreen() : const StartScreen(),
    );
  }

  Future<void> _loadPrefValue() async {
    String savedCity = await SharedPref.getSavedCity();
    setState(() => _isCitySelected = savedCity.isNotEmpty);
  }
}
