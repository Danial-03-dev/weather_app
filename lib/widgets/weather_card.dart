import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/functions/capitalize_string.dart';
import 'package:weather_app/functions/kelvin_to_celsius.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final String city;

  const WeatherCard({super.key, required this.weatherData, required this.city});

  @override
  Widget build(BuildContext context) {
    final currentWeatherData = weatherData['list'][0];
    final currentTemp = kelvinToCelsius(currentWeatherData['main']['temp']);
    final currentWeatherCondition = currentWeatherData['weather'][0]['main'];

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    capitalizeString(city),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$currentTemp°C',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WeatherIcon(weatherCondition: currentWeatherCondition),
                  Text(
                    currentWeatherCondition,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
