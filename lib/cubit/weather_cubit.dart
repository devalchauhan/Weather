import 'package:weather/model/weather_model.dart';

abstract class WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  List<WeatherData> weatherData;
  WeatherLoaded({
    required this.weatherData,
  });
}
