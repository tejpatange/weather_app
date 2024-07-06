import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/class/weatherclass.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  final String cityName;

  const WeatherPage({super.key, required this.cityName});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _weatherService = WeatherService('f752d26548fd514b4883908119007867');
  Weather? _weather;

  

  String getWeatherAnimation(String? condition) {
    if (condition == null) return 'assets/sunny.json';

    switch (condition.toLowerCase()){
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/mist.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
      return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState(){
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2C67F2),
      title: const Text('Weather', 
            style: TextStyle(color: Colors.white70),),
            centerTitle: true,
            iconTheme: const IconThemeData(
    color: Colors.white70
  ),
            actions: [IconButton(onPressed: _fetchWeather, icon: const Icon(Icons.refresh))],),
      backgroundColor: const Color(0xFF2C67F2),
      body: Container (decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF2C67F2), Color(0xFF62CFF4)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center (child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [ Text(_weather?.cityName ?? "loading city.."), Lottie.asset(getWeatherAnimation(_weather?.condition)), Text('${_weather?.temp.round()}°C'), Text(_weather?.condition ?? "")],),
      )),
    );
  }

  Future<void> _fetchWeather() async{

    //String cityName = await _weatherService.getCurrentCity();
    Future.delayed(Duration.zero, () {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  });

    try{
      final weather = await _weatherService.getWeather(widget.cityName);
      setState((){
        _weather = weather;
      });
    }

    catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('City not found.'),
          duration: Duration(seconds: 2), // Adjust as needed
        ),
      );
      Navigator.pop(context);
    }
    Navigator.of(context).pop();
  }
}