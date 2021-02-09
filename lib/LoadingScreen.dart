import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'WeatherAPI.dart';
import 'Location.dart';
import 'Result.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final apiType;
  final String place;
  LoadingScreen({@required this.apiType,this.place});
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
    if(widget.apiType==0)
    getLocation();
    else{
      searchWeather(widget.place);
    }
  }
  void searchWeather(String place)async{
    WeatherAPI api = new WeatherAPI();
    var apiArea= await api.searchCallAPI(place);
    print("LocationScreen:"+place);
    if(apiArea['cod']>=200&&apiArea['cod']<300) {
      var data = await api.callAPI(apiArea['coord']['lat'], apiArea['coord']['lon']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Result(
            weatherData: data,
            area: place,
          );
        }),
      );
    }
    else Navigator.pop(context);
  }
  void getLocation() async {
    Location l = Location();
    await l.getLocation();
    lat = l.latitude;
    lon = l.longitude;
    print("lat:"+l.latitude.toString()+"\nlon:"+l.longitude.toString());
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherAPI api = new WeatherAPI();
    var data = await api.callAPI(lat, lon);
    var area = await api.callAreaAPI(lat, lon);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Result(
          weatherData: data,
          area:area,
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
