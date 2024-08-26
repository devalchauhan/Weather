import 'package:flutter/material.dart';
import 'package:weather/api/di/dependency_injector.dart';
import 'package:weather/navigation/app_router.dart';

void main() {
  DI.I.initialize();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.splash.routeName,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
