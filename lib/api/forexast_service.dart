import 'dart:convert';
import 'package:application_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ForecastService {
  final String apiKey = 'eb4a64d5c293fb9fc3a587b5abaa7bf2';
  final String city = 'Mashhad';

  Future<List<Forecast>> fetchForecast() async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> list = data['list'];

      // فقط یک دیتا در روز انتخاب می‌کنیم (مثلاً ساعت 12:00)
      final filtered = list.where((item) {
        final dateTime = DateTime.parse(item['dt_txt']);
        return dateTime.hour == 12;
      }).map((item) => Forecast.fromJson(item)).toList();

      return filtered;
    } else {
      throw Exception('Failed to fetch forecast');
    }
  }
}
