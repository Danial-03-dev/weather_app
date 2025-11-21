import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/features/additional_weather_info.dart';
import 'package:weather_app/features/hourly_forcast.dart';
import 'package:weather_app/functions/capitalize_string.dart';
import 'package:weather_app/widgets/search_input.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:weather_app/widgets/weather_screen_appbar.dart';

class WeahterScreen extends StatefulWidget {
  const WeahterScreen({super.key});

  @override
  State<WeahterScreen> createState() => _WeahterScreenState();
}

class _WeahterScreenState extends State<WeahterScreen> {
  late Future<Map<String, dynamic>> weatherRequest;
  String city = 'London';

  void handleRefresh() {
    setState(() {
      weatherRequest = getCurrentWeather(city: city);
    });
  }

  void handleSearch(searchedCity) {
    setState(() {
      city = searchedCity;
      weatherRequest = getCurrentWeather(city: searchedCity);
    });
  }

  @override
  void initState() {
    super.initState();
    weatherRequest = getCurrentWeather(city: city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherScreenAppbar(handleRefresh: handleRefresh),
      body: FutureBuilder(
        future: weatherRequest,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Column(
              spacing: 24,
              children: [
                SearchInput(handleSearch: handleSearch),
                Text(
                  capitalizeString(snapshot.error.toString()),
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ],
            );
          }

          final weatherData = snapshot.data!;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 628),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    SearchInput(handleSearch: handleSearch),
                    WeatherCard(weatherData: weatherData, city: city),
                    HourlyForcast(weatherData: weatherData),
                    AdditionalWeatherInfo(weatherData: weatherData),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
