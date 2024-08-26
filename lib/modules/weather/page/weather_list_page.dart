import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/modules/weather/cubit/weather_cubit.dart';
import 'package:weather/modules/weather/cubit/weather_state.dart';

class WeatherListPage extends StatelessWidget {
  const WeatherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather app'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoaded && state.isLocationEnabled) {
            return ListView.builder(
              itemCount: state.weatherData.length,
              itemBuilder: (context, index) {
                var weather = state.weatherData[index];
                return ListTile(
                  title: Text(
                    weather.dateTimeText,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            );
          } else if (state is WeatherLoaded && !state.isLocationEnabled) {
            return Center(
                child: Column(
              children: [
                const Text(
                    'Your location permission is permenantly denied go to the settings and give location permission'),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    // openAppSettings();
                  },
                  child: const Text('Go to setting'),
                ),
              ],
            ));
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
