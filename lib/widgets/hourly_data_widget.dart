import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class HourlyDataWidget extends StatelessWidget {
  final List<DummyHourly> hourlyData;

  const HourlyDataWidget({
    super.key,
    required this.hourlyData,
  });

  @override
  Widget build(BuildContext context) {
    if (hourlyData.isEmpty) {
      return const Text("No hourly data available.");
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Today", style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyData.length,
            itemBuilder: (context, index) {
              final item = hourlyData[index];
              return Container(
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.blueAccent],
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: HourlyDetail(
                  temp: item.temp,
                  timeStamp: item.dt,
                  weatherIcon: item.icon,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HourlyDetail extends StatelessWidget {
  final double temp;
  final int timeStamp;
  final String weatherIcon;

  const HourlyDetail({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
  });

  String getTime(final int timeStamp) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat("jm").format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(getTime(timeStamp)),
        Image.asset(
          "assets/icons/clouds.png", // یا از NetworkImage استفاده کن
          height: 40,
          width: 40,
        ),
        Text("${temp.toStringAsFixed(1)}°C"),
      ],
    );
  }
}

List<DummyHourly> fakeHourlyData = List.generate(6, (index) {
  return DummyHourly(
    dt: DateTime.now().add(Duration(hours: index)).millisecondsSinceEpoch ~/ 1000,
    temp: 26.0 + index,
    icon: "03d",
  );
});
