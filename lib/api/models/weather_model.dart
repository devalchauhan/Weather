import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final int dt;
  final Main main;
  final List<WeatherData> weather;
  final Wind wind;
  final int visibility;
  final String dtTxt;

  const WeatherModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
    required this.dtTxt,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: List<WeatherData>.from(
        json['weather'].map((x) => WeatherData.fromJson(x)),
      ),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      dtTxt: json['dt_txt'],
    );
  }

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

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: json['humidity'],
    );
  }

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

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

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

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'],
      gust: (json['gust'] as num).toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
