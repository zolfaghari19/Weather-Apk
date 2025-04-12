import 'package:application_weather/api/forexast_service.dart';
import 'package:application_weather/controller/global_controller.dart';
import 'package:application_weather/models/weather_model.dart';
import 'package:application_weather/widgets/comfort_level.dart';
import 'package:application_weather/widgets/current_weather_widget.dart';
import 'package:application_weather/widgets/header_widget.dart';
import 'package:application_weather/widgets/hourly_data_widget.dart';
import 'package:application_weather/widgets/weather_forecast_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  // سرویس پیش‌بینی آب‌وهوا
  final ForecastService forecastService = ForecastService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () =>
              globalController.checkLoading()
                  ? const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
                  : FutureBuilder<List<Forecast>>(
                    future: forecastService.fetchForecast(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No forecast data"));
                      } else {
                        final currentWeather =
                            globalController.getData().getCurrentWeather();

                        return ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            const SizedBox(height: 25),
                            const HeaderWidget(),

                            CurrentWeatherWidget(
                              weatherDataCurrent: currentWeather,
                            ),

                            const SizedBox(height: 20),

                            // 🔵 Comfort Level


                            const SizedBox(height: 20),

                            HourlyDataWidget(hourlyData: fakeHourlyData ?? []),

                            const SizedBox(height: 20),

                            ForecastCard(forecastList: snapshot.data!),
                                                        ComfortLevel(
                              humidity:
                                  (globalController
                                              .getData()
                                              .getCurrentWeather()
                                              .main
                                              .humidity ??
                                          0)
                                      .toDouble(),
                              feelsLike:
                                  globalController
                                      .getData()
                                      .getCurrentWeather()
                                      .main
                                      .tempMax ??
                                  0.0,
                              uvIndex: 0.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      }
                    },
                  ),
        ),
      ),
    );
  }
}
