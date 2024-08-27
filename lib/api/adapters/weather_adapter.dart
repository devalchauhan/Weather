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
      dt: dt,
      main: main.asMain(),
      weather: weather.map((e) => e.asWeather()).toList(),
      wind: wind.asWind(),
      visibility: visibility,
      dtTxt: dtTxt,
    );
  }
}

extension MainAdapter on MainModel {
  Main asMain() {
    return Main(
      temp: temp,
      feelsLike: feelsLike,
      humidity: humidity,
    );
  }
}

extension WindAdapter on WindModel {
  Wind asWind() {
    return Wind(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}

extension CloudAdapter on WeatherDataModel {
  WeatherData asWeather() {
    return WeatherData(
      main: main,
      description: description,
      icon: icon,
    );
  }
}

extension WeatherModelAdapter on Weather {
  WeatherModel asWeatherModel() {
    return WeatherModel(
      dt: dt,
      main: main.asMainModel(),
      weather: weather.map((e) => e.asWeatherModel()).toList(),
      wind: wind.asWindModel(),
      visibility: visibility,
      dtTxt: dtTxt,
    );
  }
}

extension MainModelAdapter on Main {
  MainModel asMainModel() {
    return MainModel(
      temp: temp,
      feelsLike: feelsLike,
      humidity: humidity,
    );
  }
}

extension WindModelAdapter on Wind {
  WindModel asWindModel() {
    return WindModel(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}

extension WeatherDataModelAdapter on WeatherData {
  WeatherDataModel asWeatherModel() {
    return WeatherDataModel(
      main: main,
      description: description,
      icon: icon,
    );
  }
}
