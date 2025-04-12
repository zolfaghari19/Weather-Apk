import 'dart:convert';

import 'package:application_weather/models/weather_data.dart';
import 'package:application_weather/models/weather_data_current.dart';
import 'package:application_weather/models/weather_hourly.dart';
import 'package:application_weather/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherApi {
  WeatherData? weatherData;

  //verify
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    if (jsonString["main"] != null) {
      weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString)
      );
    }
    return weatherData!;
  }
}





