import 'package:weather/domain/weather.dart';

sealed class WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  List<Weather> weatherData;
  bool isLocationEnabled;
  WeatherLoaded({
    required this.weatherData,
    required this.isLocationEnabled,
  });
}
