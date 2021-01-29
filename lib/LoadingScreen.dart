import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'WeatherAPI.dart';
import 'Location.dart';
import 'Result.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoadingScreen> {
  String msg = "hello";
  double lat, lon;
  Position position;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location l = Location();
    await l.getLocation();
    lat = l.latitude;
    lon = l.longitude;
    print(lat);
    print(lon);
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherAPI api = new WeatherAPI();
    var data = await api.callAPI(lat, lon);
    // double temp=data['main']['temp'];
    // double humidity=data['main']['humidity'];
    // String description=data['weather'][0]['description'];
    print(data.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Result(
          weatherData: data,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
