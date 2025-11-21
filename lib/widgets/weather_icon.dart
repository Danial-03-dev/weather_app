import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherCondition;
  final double size;

  const WeatherIcon({
    super.key,
    required this.weatherCondition,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      weatherCondition == 'Clouds' || weatherCondition == 'Rain'
          ? Icons.cloud
          : Icons.sunny,
      size: size,
    );
  }
}
