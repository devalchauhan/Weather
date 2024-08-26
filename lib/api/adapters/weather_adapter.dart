import 'package:weather/api/models/weather_model.dart';
import 'package:weather/domain/weather.dart';

extension WeatherListAdapter on List<WeatherModel> {
  List<Weather> asWeatherList() {
    return map((e) => e.asWeather()).toList();
  }
}

extension WeatherAdapter on WeatherModel {
  Weather asWeather() {
    return Weather(
      dateTimeInMilliSeconds: dt,
      temp: main.temp,
      feelsLike: main.feelsLike,
      humidity: main.humidity,
      clouds: weather.map((e) => e.asCloud()).toList(),
      windSpeed: wind.speed,
      windDegree: wind.deg,
      visibility: visibility,
      dateTimeText: dtTxt,
    );
  }
}

extension CloudAdapter on WeatherData {
  Cloud asCloud() {
    return Cloud(
      main: main,
      description: description,
      icon: icon,
    );
  }
}
