import 'package:application_weather/models/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current; // تغییر از nullable به non-nullable
  WeatherData([this.current]);

  WeatherDataCurrent getCurrentWeather() => current!;
}
