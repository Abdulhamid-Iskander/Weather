import 'package:flutter/material.dart';
import 'loading_screen.dart'; // استيراد شاشة التحميل الجديدة

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter city name (e.g. London, Cairo)',
                labelText: 'City Name',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.orange),
                  onPressed: () {
                    _searchCity(context); // استدعاء دالة البحث
                  },
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) =>
                  _searchCity(context), // البحث عند الضغط على Enter
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _searchCity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Get Weather',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة البحث الجديدة
  void _searchCity(BuildContext context) {
    if (_controller.text.trim().isEmpty) {
      // عرض رسالة خطأ إذا كان الحقل فارغًا
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a city name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // الانتقال إلى شاشة التحميل مع اسم المدينة
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(city: _controller.text.trim()),
      ),
    );
  }
}
