import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/api/api.dart';
import 'package:weather/modules/weather/cubit/weather_cubit.dart';
import 'package:weather/utils/commands/get_weather_command.dart';
import 'package:weather/utils/services/weather_service.dart';

class DI {
  static final DI I = DI._internal();
  final GetIt _getIt = GetIt.instance;
  factory DI() {
    return I;
  }

  DI._internal();

  void initialize() {
    final dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['appid'] = '37ea9939152496e5de6ca532f93817fd';
        return handler.next(options);
      },
    ));
    // Register all dependencies here
    _getIt.registerLazySingleton<Api>(() => Api(dio));
    _getIt.registerFactory<WeatherService>(() => WeatherService(_getIt<Api>()));
    _getIt.registerFactory<GetWeatherCommand>(
        () => GetWeatherCommand(_getIt<WeatherService>()));
    _getIt.registerFactoryParam<WeatherCubit, void, void>(
        (_, __) => WeatherCubit(_getIt<GetWeatherCommand>()));
  }

  T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
