import 'package:application_weather/models/weather/clouds.dart';
import 'package:application_weather/models/weather/wind.dart';

class WeatherDataCurrent {
  final Current main;
  final List<Weather>? weather;
  final Wind wind;
  final Clouds clouds;

  WeatherDataCurrent({
    required this.main,
    required this.wind,
    required this.clouds,
    this.weather,
  });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    if (json['main'] == null || json['wind'] == null || json['clouds'] == null) {
      throw Exception("main, wind, or cloud data not found");
    }

    return WeatherDataCurrent(
      main: Current.fromJson(json["main"]),
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      weather: json['weather'] != null
          ? (json['weather'] as List<dynamic>)
              .map((e) => Weather.fromJson(e))
              .toList()
          : null,
    );
  }

@override
String toString() {
  return '''
  WeatherDataCurrent:
  - Temperature: ${main.temp ?? "No Data"}
  - Wind Speed: ${wind.speed ?? "No Data"}
  - Cloud Coverage: ${clouds.all ?? "No Data"}
  - Weather Description: ${weather != null && weather!.isNotEmpty ? weather![0].description : "No Data"}
  ''';
}

}


class Current {
  int? temp;
  double? tempMin;
  double? tempMax;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Current({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    temp: (json['temp'] as num?)?.round(),
    tempMin: (json['temp_min'] as num?)?.toDouble(),
    tempMax: (json['temp_max'] as num?)?.toDouble(),
    humidity: json['humidity'] as int?,
    seaLevel: json['sea_level'] as int?,
    grndLevel: json['grnd_level'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'humidity': humidity,
    'sea_level': seaLevel,
    'grnd_level': grndLevel,
  };
}

class Weather {
  String? main;
  String? description;
  String? icon;

  Weather({this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    main: json['main'] as String?,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'main': main,
    'description': description,
    'icon': icon,
  };
}
