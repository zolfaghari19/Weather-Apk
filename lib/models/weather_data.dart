import 'package:application_weather/models/weather_data_current.dart';
import 'package:application_weather/models/weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  WeatherData([this.current, this.hourly]);

  WeatherDataCurrent getCurrentWeather() {
  if (current == null) {
    throw Exception("WeatherDataCurrent is null");
  }
  return current!;
}
  WeatherDataHourly getHourlyWeather() => hourly!;
}
