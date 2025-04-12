import 'package:application_weather/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastCard extends StatelessWidget {
  final List<Forecast> forecastList;

  const ForecastCard({super.key, required this.forecastList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Padding(
                 padding: const EdgeInsets.only(right: 100),
                 child: const Text("Next Days",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
               ),
              ]
            ),
          ),
          const SizedBox(height: 16),
          ...forecastList.map((forecast) {
            final day = DateFormat('E').format(forecast.date);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(day),
                  Image.asset(
                    'assets/icons/clear-sky.png',
                    width: 30,
                    height: 30,
                  ),
                  Text('${forecast.temperature.toStringAsFixed(0)}°C'),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
