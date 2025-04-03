import 'package:application_weather/api/fetch_weather.dart';
import 'package:application_weather/models/weather_data.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  bool checkLoading() => _isLoading.value;
  double getLatitude() => _latitude.value;
  double getLongitude() => _longitude.value;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation().catchError((error) {
        print("Error: $error");
        _isLoading.value = false;
      });
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    var locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("User denied the location permission");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _latitude.value = position.latitude;
    _longitude.value = position.longitude;

    await FetchWeatherApi()
        .processData(position.latitude, position.longitude)
        .then((value) {
          weatherData.value = value;
        });

    _isLoading.value = false;
  }
}
