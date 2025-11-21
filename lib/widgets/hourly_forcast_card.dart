import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class HourlyForcastCard extends StatelessWidget {
  final String time;
  final String weatherCondition;
  final String temperature;

  const HourlyForcastCard({
    super.key,
    required this.time,
    required this.weatherCondition,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              WeatherIcon(weatherCondition: weatherCondition, size: 32),
              Text('$temperature°C'),
            ],
          ),
        ),
      ),
    );
  }
}
