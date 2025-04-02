import 'dart:convert';

import 'package:application_weather/models/weather_data.dart';
import 'package:application_weather/models/weather_data_current.dart';
import 'package:application_weather/utils/api_url.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class FetchWeatherApi {
  WeatherData? weatherData;

  //verify
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    debugPrint("Full Api Response : ${response.body}");

    var jsonString = jsonDecode(response.body);
    print("Parsed JSON: $jsonString");
    if (jsonString["main"] != null) {
      weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    }else{
      print("no 'main' data found in the response.");
    }
    //weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

