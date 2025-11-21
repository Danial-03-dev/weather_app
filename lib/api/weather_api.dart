import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

Future<Map<String, dynamic>> getCurrentWeather({String city = "London"}) async {
  try {
    final res = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$openWeatherApiKey",
      ),
    );

    final data = jsonDecode(res.body);

    if (data['cod'] != '200') {
      throw data['message'] ?? 'An unexpedted error occured';
    }

    return data;
  } catch (e) {
    throw e.toString();
  }
}
