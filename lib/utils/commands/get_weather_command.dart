import 'package:weather/domain/weather.dart';
import 'package:weather/utils/services/weather_service.dart';

class GetWeatherCommand {
  const GetWeatherCommand(
    this._weatherService,
  );

  final WeatherService _weatherService;

  Future<List<Weather>> call({
    required double lat,
    required double lon,
  }) {
    return _weatherService
        .getWeather(
          lat: lat,
          lon: lon,
        )
        .then(
          (result) => result,
        );
  }
}
