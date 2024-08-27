import 'package:weather/domain/weather.dart';

sealed class WeatherStates {
  const WeatherStates();
}

class WeatherLoading extends WeatherStates {}

class WeatherError extends WeatherStates {
  final String error;

  WeatherError({required this.error});
}

class WeatherLoaded extends WeatherStates {
  final List<Weather> weatherData;
  final bool isLocationEnabled;
  const WeatherLoaded({
    required this.weatherData,
    required this.isLocationEnabled,
  });
}
