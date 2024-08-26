import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/service/location_service.dart';
import 'package:weather/utils/commands/get_weather_command.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeatherCommand getWeatherCommand;
  final LocationService locationService = LocationService();
  double lat = 23.1211008;
  double lon = 72.5778432;
  WeatherCubit(
    this.getWeatherCommand,
  ) : super(WeatherLoading()) {
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

  void getWeatherData({required bool isLocationEnabled}) async {
    await getWeatherCommand
        .call(
      lat: lat,
      lon: lon,
    )
        .then((listOfWeatherData) {
      emit(WeatherLoaded(
          weatherData: listOfWeatherData,
          isLocationEnabled: isLocationEnabled));
    }).catchError((error) {
      // emit(WeatherError(error: error.toString()));
    });
  }
}
