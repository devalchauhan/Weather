import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio;

  WeatherService(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['appid'] = '37ea9939152496e5de6ca532f93817fd';
        return handler.next(options);
      },
    ));
  }

  Future<Response> getWeather(double lat, double lon) async {
    return await _dio.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
      },
    );
  }
}
