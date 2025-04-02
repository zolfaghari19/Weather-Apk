import 'clouds.dart';
import 'coord.dart';
import 'current.dart';
import 'sys.dart';
import 'wind.dart';

class Weather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Current? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    coord:
        json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, dynamic>),
    weather:
        (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
    base: json['base'] as String?,
    main:
        json['main'] != null
            ? Current.fromJson(json['main']) : null,
                
    visibility: json['visibility'] as int?,
    wind:
        json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    clouds:
        json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as int?,
    sys:
        json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    cod: json['cod'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'coord': coord?.toJson(),
    'weather': weather?.map((e) => e.toJson()).toList(),
    'base': base,
    'main': main?.toJson(),
    'visibility': visibility,
    'wind': wind?.toJson(),
    'clouds': clouds?.toJson(),
    'dt': dt,
    'sys': sys?.toJson(),
    'timezone': timezone,
    'id': id,
    'name': name,
    'cod': cod,
  };
}
