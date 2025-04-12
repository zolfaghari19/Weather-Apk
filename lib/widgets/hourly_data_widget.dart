import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DummyHourly {
  final int dt; // timestamp
  final double temp;
  final String icon;

  DummyHourly({required this.dt, required this.temp, required this.icon});
}

class HourlyDataWidget extends StatefulWidget {
  final List<DummyHourly> hourlyData;

  HourlyDataWidget({super.key, required this.hourlyData});

  @override
  State<HourlyDataWidget> createState() => _HourlyDataWidgetState();
}

class _HourlyDataWidgetState extends State<HourlyDataWidget> {
  int selectedIndex = 0; // وضعیت انتخاب شده

  @override
  Widget build(BuildContext context) {
    if (widget.hourlyData.isEmpty) {
      return const Text("No hourly data available.");
    }

    return Column(
      children: [
        Container(child: Text("Today", style: TextStyle(fontSize: 18))),
        SizedBox(
          height: 140,
          child: Stack(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.hourlyData.length,
                itemBuilder: (context, index) {
                  final item = widget.hourlyData[index];
                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 100,
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ]
                                : [],
                        color:
                            isSelected
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: HourlyDetail(
                        temp: item.temp,
                        timeStamp: item.dt,
                        weatherIcon: item.icon,
                      ),
                    ),
                  );
                },
              ),
            ],
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
        Image.asset("assets/icons/clouds.png", height: 40, width: 40),
        Text("${temp.toStringAsFixed(1)}°C"),
      ],
    );
  }
}

List<DummyHourly> fakeHourlyData = List.generate(6, (index) {
  return DummyHourly(
    dt:
        DateTime.now().add(Duration(hours: index)).millisecondsSinceEpoch ~/
        1000,
    temp: 26.0 + index,
    icon: "03d",
  );
});
