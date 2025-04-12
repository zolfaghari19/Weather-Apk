import 'package:application_weather/main.dart';
import 'package:application_weather/widgets/hourly_data_widget.dart';

class WeatherDataHourly {
  final List<Hourly> main; // ✅ به جای Hourly یک لیست استفاده کن

  WeatherDataHourly({required this.main});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    return WeatherDataHourly(
      main:
          (json['hourly'] != null)
              ? (json['hourly'] as List<dynamic>)
                  .map((e) => Hourly.fromJson(e))
                  .toList()
              : [],
    );
  }
  List<DummyHourly> toDummyHourlyList() {
    return main.map((e) => DummyHourly(
      dt: e.dt ?? 0,
      temp: e.temp ?? 0.0,
      icon: e.weather != null && e.weather!.isNotEmpty
          ? e.weather![0].icon ?? ""
          : "",
    )).toList();
  }
}


@override
 String toString(dynamic wind, dynamic clouds) {
  var weather;
  return '''
  WeatherDataCurrent:
  - Temperature: ${main.temp ?? "No Data"}
  - Wind Speed: ${wind.speed ?? "No Data"}
  - Cloud Coverage: ${clouds.all ?? "No Data"}
  - Weather Description: ${weather != null && weather!.isNotEmpty ? weather![0].description : "No Data"}
  ''';
}

extension on void Function() {
  get temp => null;
} 
class Hourly {
  int? dt;
  double? temp;
  double? tempMin;
  double? tempMax;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    dt: json['dt'] as int?, // ✅ زمان اضافه شد
    temp: (json['temp'] as num?)?.round().toDouble(),
    tempMin: (json['temp_min'] as num?)?.toDouble(),
    tempMax: (json['temp_max'] as num?)?.toDouble(),
    humidity: json['humidity'] as int?,
    seaLevel: json['sea_level'] as int?,
    grndLevel: json['grnd_level'] as int?,
    weather:
        (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e))
            .toList(), // ✅ آیکون آب‌وهوا اضافه شد
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
class DummyHourly {
  final int dt; // timestamp
  final double temp;
  final String icon;

  DummyHourly({
    required this.dt,
    required this.temp,
    required this.icon,
  });
}
