import 'package:application_weather/models/weather_data_current.dart';
import 'package:application_weather/utils/coustom_color.dart';
import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  final List<Weather>? weather;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherDataCurrent,
    this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        SizedBox(height: 30),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Image.asset("assets/icons/wind.png"),
            ),

            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/temperature.png",),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.wind.speed}km/h",
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.clouds.all}%",
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.main.humidity}%",
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    //print("Weather List : ${weatherDataCurrent.weather}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/fog.png", width: 75, height: 75),
        //Container(height: 50, width: 50, color: CustomColor.dividerLine),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.main.temp!.toInt()}°",
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.textColorBlack,
                ),
              ),
              TextSpan(
                text:
                    weatherDataCurrent.weather != null &&
                            weatherDataCurrent.weather!.isNotEmpty
                        ? "${weatherDataCurrent.weather![0].description}"
                        : "No Data",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
