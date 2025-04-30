import 'package:flutter/material.dart';
import '../models/weather_model.dart'; // استيراد نموذج بيانات الطقس

class CityScreen extends StatelessWidget {
  final WeatherModel weather; // بيانات الطقس التي يتم استقبالها

  const CityScreen(
      {super.key, required this.weather}); // constructor معدل لاستقبال البيانات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFA500), Color(0xFFFFD580)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // عرض اسم المدينة من بيانات API
            Text(
              weather.city,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            // عرض اسم الدولة من بيانات API
            Text(
              weather.country,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // عرض أيقونة الطقس من API
                Image.network(
                  weather.iconUrl,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.wb_sunny,
                      size: 40,
                      color: Colors.yellow),
                ),
                const SizedBox(width: 16),
                // عرض درجة الحرارة من API
                Text(
                  "${weather.tempC}°C",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // عرض حالة الطقس من API
            Text(
              weather.condition,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
