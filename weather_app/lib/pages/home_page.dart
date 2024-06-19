import 'package:flutter/material.dart';
import 'package:weather_app/components/data_tile.dart';
import 'package:weather_app/services/WeatherModel.dart';
import 'package:weather_app/secrets/api_key.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchWeather();
    // TODO: implement initState
    super.initState();
  }

  final _weatherService = WeatherService(apiKey);
  WeatherModel? _weatherModel;
  _fetchWeather() async {
    String cityName = await _weatherService.getLocation();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weatherModel = weather;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return "lib/assets/find.json";
    }
    switch (mainCondition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "lib/assets/cloud.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "lib/assets/rain.json";
      case "thunderstorm":
        return "lib/assets/storm.json";
      case "clear":
        return "lib/assets/sunny.json";
    }
    return "lib/assets/find.json";
  }

  @override
  Widget build(BuildContext context) {
    if (_weatherModel == null) {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    }
    final String? mainCondition = _weatherModel!.weather?[0].main;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                // const SizedBox(
                //   height: 25,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      _weatherModel!.name ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Lottie.asset(
                  getWeatherAnimation(mainCondition),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_weatherModel!.main!.temp!.round()}°C",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      _weatherModel!.weather![0].description.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Weather Details",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      DataTile(
                        data1: "${_weatherModel!.main!.feelsLike}°C",
                        data2: "${(_weatherModel!.visibility! / 1000)}km",
                        icon1: Icons.hot_tub,
                        icon2: Icons.remove_red_eye,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DataTile(
                        data1: "${_weatherModel!.main!.pressure} hPa",
                        data2: "${_weatherModel!.main!.humidity}%",
                        icon1: Icons.beach_access,
                        icon2: Icons.water_drop,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DataTile(
                        data1: "${_weatherModel!.wind!.speed}km",
                        data2: "${_weatherModel!.clouds!.all}%",
                        icon1: Icons.wind_power_outlined,
                        icon2: Icons.cloud,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
