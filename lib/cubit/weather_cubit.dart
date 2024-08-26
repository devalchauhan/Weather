import 'package:weather/model/weather_model.dart';

abstract class WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  List<WeatherData> weatherData;
  bool isLocationEnabled;
  WeatherLoaded({
    required this.weatherData,
    required this.isLocationEnabled,
  });
}
