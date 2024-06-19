import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/WeatherModel.dart';

class WeatherService {
  final String apiKey;
  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather(String? cityName) async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric"),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  Future<String> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placeMark[0].locality;
    return city ?? "";
  }
}
