import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/functions/kelvin_to_celsius.dart';
import 'package:weather_app/widgets/hourly_forcast_card.dart';

class HourlyForcast extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final totalCards = 5;
  const HourlyForcast({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Hourly Forecast',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 128,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown,
              },
            ),
            child: ListView.builder(
              itemCount: totalCards,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final hourlyForcastData = weatherData['list'][index + 1];
                final time = DateTime.parse(hourlyForcastData['dt_txt']);
                final hourlyWeatherCondition =
                    hourlyForcastData['weather'][0]['main'];
                final temperature = kelvinToCelsius(
                  hourlyForcastData['main']['temp'],
                );

                return HourlyForcastCard(
                  time: DateFormat.j().format(time),
                  weatherCondition: hourlyWeatherCondition,
                  temperature: temperature,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
