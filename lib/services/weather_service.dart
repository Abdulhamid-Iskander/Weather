import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/weather_model.dart';

class WeatherService {
  static const String _baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = 'e2f4ecbc17c04807aa2165342253004';

  Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/current.json?key=$apiKey&q=$city"),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
