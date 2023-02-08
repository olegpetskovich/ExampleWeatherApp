import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mycode/const/colors.dart';
import 'package:weather_app_mycode/const/styles.dart';
import 'package:weather_app_mycode/generated/l10n.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_bloc.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_event.dart';
import 'package:weather_app_mycode/presentation/bloc/weather_state.dart';
import 'package:weather_app_mycode/utils/Utils.dart';
import 'package:weather_app_mycode/utils/shared_preference.dart';
import '../../weatherScreen/weather_screen.dart';

class CitiesDropdownButton extends StatefulWidget {
  const CitiesDropdownButton({Key? key}) : super(key: key);

  @override
  State<CitiesDropdownButton> createState() => _CitiesDropdownButtonState();
}

class _CitiesDropdownButtonState extends State<CitiesDropdownButton> {
  String _cityName = "";
  late WeatherBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WeatherBloc();
    _bloc.add(WeatherGetCitiesListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Container(
            margin: Styles.paddingHor40,
            padding: Styles.paddingHor20Ver5,
            decoration: Styles.boxRounded40ColorAppMain,
            child: DropdownButton<String>(
              style: Styles.textPinkLight25,
              value: _cityName.isEmpty ? null : _cityName,
              iconEnabledColor: colorPinkLight,
              dropdownColor: colorBrownDark,
              underline: const SizedBox(),
              isExpanded: true,
              hint: Center(
                child: Text(
                  S.of(context).select_city,
                  style: Styles.textPinkLight,
                ),
              ),
              items: getCitiesItemsList(state),
              onChanged: (String? value) {
                _cityName = value ?? "";
                SharedPref.saveSelectedCity(city: _cityName);
                Utils.navigate(
                    context: context,
                    screenWidget: const WeatherScreen(),
                    isClearStack: true);
              },
            ),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> getCitiesItemsList(WeatherState state) {
    return state.citiesList.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Center(child: Text(option)),
      );
    }).toList();
  }
}
