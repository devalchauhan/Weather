import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/modules/weather/cubit/weather_cubit.dart';
import 'package:weather/modules/weather/cubit/weather_state.dart';
import 'package:weather/utils/extensions/helper_extensions.dart';

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

                final String iconUrl =
                    'https://openweathermap.org/img/wn/${weather.weather[0].icon}.png';

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.grey.shade400,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thermostat),
                            Text(
                              '${weather.main.temp.toCelsius()}°C',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Text(
                          'Feels like ${weather.main.feelsLike.toCelsius()}°C',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Image.network(
                          iconUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 10,
                              width: 10,
                            );
                          },
                        ),
                        Text(
                          weather.weather[0].description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    trailing: Text(
                      weather.dtTxt.formatDateTime(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
