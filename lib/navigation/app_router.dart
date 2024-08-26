import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/di/dependency_injector.dart';
import 'package:weather/modules/splash/page/splash_page.dart';
import 'package:weather/modules/weather/cubit/weather_cubit.dart';
import 'package:weather/modules/weather/page/weather_list_page.dart';

// Enum to represent different app routes
enum AppRoute {
  splash, // Splash screen route
  home, // Home screen route
}

// Extension on AppRoute to get the route name for each route
extension AppRoutesExtension on AppRoute {
  String get routeName {
    switch (this) {
      case AppRoute.splash:
        return '/'; // Route name for splash screen
      case AppRoute.home:
        return '/home'; // Route name for home screen
    }
  }
}

class AppRouter {
  // Route generator method
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final AppRoute? route = _getAppRouteFromName(settings.name);
    switch (route) {
      case AppRoute.splash:
        return MaterialPageRoute(
            builder: (_) =>
                const SplashPage()); // Generate route for splash screen
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<WeatherCubit>(
            create: (context) => DI.I.get<WeatherCubit>(),
            child: const WeatherListPage(),
          ),
        ); // Generate route for home screen
      default:
        return MaterialPageRoute(
            builder: (_) => Container()); // Default route (empty container)
    }
  }

  // Helper method to get AppRoute from route name
  static AppRoute? _getAppRouteFromName(String? name) {
    for (var route in AppRoute.values) {
      if (route.routeName == name) return route;
    }
    return null;
  }
}
