import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_mycode/models/weather_model.dart';

class WeatherApiService {
  Future<Weather> getCurrentWeather(String city) async {
    String apiKey = "57f5f8356b26c042ff15a79e144f792a";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Future.value(Weather.fromJson(jsonDecode(response.body)));
    } else {
      return Future.value(Weather(
          temp: 0, feelsLike: 0, low: 0, high: 0, description: 'NO DATA'));
    }
  }

  List<String> getCitiesList() {
    return ["New York", "London", "Odesa", "Kyiv", "Jerusalem"];
  }
}
