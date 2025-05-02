import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = 'e2f4ecbc17c04807aa2165342253004';

  final Dio _dio = Dio();

  Future<WeatherModel> getWeather(String city) async {
    try {
      final response = await _dio.get(
        "$baseUrl/current.json",
        queryParameters: {
          "key": apiKey,
          "q": city,
        },
      );

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception("❌ Failed to load weather data: $e");
    }
  }
}
