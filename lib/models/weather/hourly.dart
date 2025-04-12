class Hourly {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? humidity;
  int? pressure;
  int? seaLevel;
  int? grndLevel;

  Hourly({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      temp: (json['temp'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      pressure: json['pressure'] as int?,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'humidity': humidity,
    'pressure': pressure,
    'sea_level': seaLevel,
    'grnd_level': grndLevel,
  };
}
