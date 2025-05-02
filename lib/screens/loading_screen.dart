import 'package:flutter/material.dart';
import 'city_screen.dart';
import '../services/weather_service.dart';

class LoadingScreen extends StatefulWidget {
  final String city;
  const LoadingScreen({super.key, required this.city});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  Future<void> _loadWeatherData() async {
    try {
      final weather = await WeatherService().getWeather(widget.city);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CityScreen(weather: weather),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
