import 'package:geolocator/geolocator.dart';
import 'package:weather/api/adapters/weather_adapter.dart';
import 'package:weather/api/models/weather_model.dart';
import 'package:weather/service/location_service.dart';
import 'package:weather/utils/commands/get_weather_command.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherStates> {
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

  @override
  WeatherStates? fromJson(Map<String, dynamic> json) {
    try {
      final List<WeatherModel> weatherData =
          (json['state'] as List).map((e) => WeatherModel.fromJson(e)).toList();
      return WeatherLoaded(
          weatherData: weatherData.map((e) => e.asWeather()).toList(),
          isLocationEnabled: true);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherStates state) {
    if (state is WeatherLoaded) {
      return {
        'state':
            state.weatherData.map((e) => e.asWeatherModel().toJson()).toList()
      };
    }
    return null;
  }
}
