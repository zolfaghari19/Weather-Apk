import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ComfortLevel extends StatelessWidget {
  final double humidity;
  final double feelsLike;
  final double uvIndex;

  const ComfortLevel({
    super.key,
    required this.humidity,
    required this.feelsLike,
    required this.uvIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Comfort Level",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        const SizedBox(
          height: 10,
        ),
        CircularPercentIndicator(radius: 80.0,
        lineWidth: 12.0,
        percent: humidity / 100,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${humidity.toInt()}%",
            style:TextStyle(fontSize: 24 , fontWeight: FontWeight.bold)) ,
          const Text("Humidity", style: TextStyle(fontSize: 14),),
          ],
        
        ),
        progressColor: Colors.blue,
        backgroundColor: Colors.blue.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Feels Like : ${feelsLike.toStringAsFixed(1)}°"),
            Container(height: 20, width: 1, color: Colors.grey,),
            Text("UV Index : ${uvIndex.toStringAsFixed(1)}"),
          ],
        )

      ],
    );
  }
}
