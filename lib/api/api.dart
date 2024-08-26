// coverage:ignore-file
//DONT_GENERATE_TEST_FILE

import 'package:dio/dio.dart';
import 'package:weather/api/models/weather_model.dart';

/// Api for connecting to backend services
///
/// Results in API model classes
class Api {
  const Api(this._httpClient);

  final Dio _httpClient;

  Future<List<WeatherModel>> getWeather({
    required double lat,
    required double lon,
  }) async {
    final result = await _httpClient.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
      },
    );
    return List<WeatherModel>.from(
      result.data['list'].map(
        (x) => WeatherModel.fromJson(x),
      ),
    );
  }
}
