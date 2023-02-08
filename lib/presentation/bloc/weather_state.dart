import 'package:weather_app_mycode/models/weather_model.dart';

class WeatherState {
  final String city;
  final Weather weatherInfo;
  final List<String> citiesList;

  WeatherState({
    required this.city,
    required this.weatherInfo,
    required this.citiesList,
  });

  factory WeatherState.initial() => WeatherState(
    city: 'NO DATA',
    weatherInfo: Weather(
          temp: 0,
          feelsLike: 0,
          low: 0,
          high: 0,
          description: 'NO DATA',
        ),
        citiesList: [],
      );

  WeatherState copyWith({
    String? city,
    Weather? weatherInfo,
    List<String>? citiesList,
  }) {
    return WeatherState(
      city: city ?? this.city,
      weatherInfo: weatherInfo ?? this.weatherInfo,
      citiesList: citiesList ?? this.citiesList,
    );
  }
}
