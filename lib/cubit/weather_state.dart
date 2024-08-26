import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';
import 'weather_cubit.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final WeatherService weatherService = WeatherService(Dio());
  final double lat = 23.1211008;
  final double lon = 72.5778432;
  WeatherCubit() : super(WeatherLoading()) {
    getWeatherData();
  }

  getWeatherData() async {
    final response = await weatherService.getWeather(lat, lon);
    List<WeatherData> listOfWeatherData = List<WeatherData>.from(
      response.data['list'].map((x) => WeatherData.fromJson(x)),
    );
    emit(
      WeatherLoaded(
        weatherData: listOfWeatherData,
      ),
    );
  }
}
