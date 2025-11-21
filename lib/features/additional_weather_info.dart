import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_info_item.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const AdditionalWeatherInfo({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final currentWeatherData = weatherData['list'][0];

    final currentPressure = currentWeatherData['main']['pressure'].toString();
    final currentHumidity = currentWeatherData['main']['humidity'].toString();
    final currentWindSpeed = currentWeatherData['wind']['speed'].toString();

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Info',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AdditionalInfoItem(
              icon: Icons.water_drop,
              label: 'Humidity',
              value: currentHumidity,
            ),
            AdditionalInfoItem(
              icon: Icons.air,
              label: 'Wind Speed',
              value: currentWindSpeed,
            ),
            AdditionalInfoItem(
              icon: Icons.beach_access,
              label: 'Pressure',
              value: currentPressure,
            ),
          ],
        ),
      ],
    );
  }
}
