import 'package:weather/api/adapters/weather_adapter.dart';
import 'package:weather/api/api.dart';
import 'package:weather/domain/weather.dart';

/// Place to wrap calls to [Api] class with models and adapt the responses to
/// use domain level models for system domain Like repository pattern.
class WeatherService {
  const WeatherService(this._api);

  final Api _api;

  Future<List<Weather>> getWeather({
    required double lat,
    required double lon,
  }) async {
    final result = await _api.getWeather(lat: lat, lon: lon);
    return result.asWeatherList();
  }
}
