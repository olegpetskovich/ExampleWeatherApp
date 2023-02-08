import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_bloc.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_event.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_state.dart';
import 'package:weather_app_mycode/presentation/screens/weatherScreen/widgets/city_home_button_panel.dart';
import 'package:weather_app_mycode/presentation/screens/weatherScreen/widgets/temperature_info.dart';
import 'package:weather_app_mycode/presentation/widgets/weather_lottie_bg.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WeatherBloc();
    _bloc.add(WeatherGetWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WeatherLottieBg(),
          BlocConsumer<WeatherBloc, WeatherState>(
            bloc: _bloc,
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  TemperatureInfo(
                    temp: '${state.weatherInfo.temp.toString()}°C',
                    description: state.weatherInfo.description.toString(),
                  ),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  CityAndHomeButtonPanel(city: state.city),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
