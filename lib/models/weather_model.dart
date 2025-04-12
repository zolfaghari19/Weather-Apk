class Forecast {
  final DateTime date;
  final double temperature;
  final String icon;

  Forecast({
    required this.date,
    required this.temperature,
    required this.icon,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'],
      icon: json['weather'][0]['icon'],
    );
  }
}
