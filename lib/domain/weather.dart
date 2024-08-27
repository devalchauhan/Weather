import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int dt;
  final Main main;
  final List<WeatherData> weather;
  final Wind wind;
  final int visibility;
  final String dtTxt;

  const Weather({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        wind,
        visibility,
        dtTxt,
      ];
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final int humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        humidity,
      ];
}

class WeatherData extends Equatable {
  final String main;
  final String description;
  final String icon;

  const WeatherData({
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        main,
        description,
        icon,
      ];
}

class Wind extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
