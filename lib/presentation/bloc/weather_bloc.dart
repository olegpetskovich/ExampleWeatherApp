import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_event.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_state.dart';
import 'package:weather_app_mycode/repo/weather_repository.dart';
import 'package:weather_app_mycode/utils/shared_preference.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial()) {
    on<WeatherGetWeatherEvent>(_onGetWeather);
    on<WeatherGetCitiesListEvent>(_onGetCitiesList);
  }

  Future<void> _onGetWeather(
      WeatherGetWeatherEvent event, Emitter emitter) async {
    String city = await SharedPref.getSavedCity();
    emitter(state.copyWith(
      weatherInfo: await WeatherApiService().getCurrentWeather(city),
      city: city,
    ));
  }

  Future<void> _onGetCitiesList(
      WeatherGetCitiesListEvent event, Emitter emitter) async {
    emitter(state.copyWith(citiesList: WeatherApiService().getCitiesList()));
  }
}
