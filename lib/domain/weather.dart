import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int dateTimeInMilliSeconds;
  final double temp;
  final double feelsLike;
  final int humidity;
  final List<Cloud> clouds;
  final double windSpeed;
  final int windDegree;
  final int visibility;
  final String dateTimeText;

  const Weather({
    required this.dateTimeInMilliSeconds,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    required this.windDegree,
    required this.visibility,
    required this.dateTimeText,
  });

  @override
  List<Object?> get props => [
        dateTimeInMilliSeconds,
        temp,
        feelsLike,
        humidity,
        clouds,
        windSpeed,
        windDegree,
        visibility,
        dateTimeText,
      ];
}

class Cloud extends Equatable {
  final String main;
  final String description;
  final String icon;

  const Cloud({
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
