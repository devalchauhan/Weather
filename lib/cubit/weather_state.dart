import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/location_service.dart';
import 'package:weather/service/weather_service.dart';
import 'weather_cubit.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final WeatherService weatherService = WeatherService(Dio());
  final LocationService locationService = LocationService();
  double lat = 23.1211008;
  double lon = 72.5778432;
  WeatherCubit() : super(WeatherLoading()) {
    getLocation();
  }

  getLocation() async {
    Position? position = await locationService.determinePosition();
    if (position != null) {
      lat = position.latitude;
      lon = position.longitude;
    }
    getWeatherData(isLocationEnabled: position != null);
  }

  getWeatherData({required bool isLocationEnabled}) async {
    final response = await weatherService.getWeather(lat, lon);
    List<WeatherData> listOfWeatherData = List<WeatherData>.from(
      response.data['list'].map((x) => WeatherData.fromJson(x)),
    );
    emit(
      WeatherLoaded(
          weatherData: listOfWeatherData, isLocationEnabled: isLocationEnabled),
    );
  }
}
