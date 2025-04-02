import 'package:application_weather/controller/global_controller.dart';
import 'package:application_weather/widgets/current_weather_widget.dart';
import 'package:application_weather/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call the global controller
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () =>
              globalController.checkLoading()
                  ? Center(child: CircularProgressIndicator(color: Colors.blue))
                  : Center(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const HeaderWidget(),
                        CurrentWeatherWidget(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather(),
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}
