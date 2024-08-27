import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final int dt;
  final MainModel main;
  final List<WeatherDataModel> weather;
  final WindModel wind;
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
      main: MainModel.fromJson(json['main']),
      weather: List<WeatherDataModel>.from(
        json['weather'].map((x) => WeatherDataModel.fromJson(x)),
      ),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'],
      dtTxt: json['dt_txt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'main': main.toJson(),
      'weather': weather.map((data) => data.toJson()).toList(),
      'wind': wind.toJson(),
      'visibility': visibility,
      'dt_txt': dtTxt,
    };
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

class MainModel extends Equatable {
  final double temp;
  final double feelsLike;
  final int humidity;

  const MainModel({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'humidity': humidity,
    };
  }

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        humidity,
      ];
}

class WeatherDataModel extends Equatable {
  final String main;
  final String description;
  final String icon;

  const WeatherDataModel({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  @override
  List<Object?> get props => [
        main,
        description,
        icon,
      ];
}

class WindModel extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'],
      gust: (json['gust'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
