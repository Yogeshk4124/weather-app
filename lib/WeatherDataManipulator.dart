import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDataManipulator{
  final dynamic weatherData;
  WeatherDataManipulator({@required this.weatherData});
  AssetImage getImage(String icon){
    switch(icon){
      case "01d":{return AssetImage("assets/day/D01.png");}
      break;
      case "02d":{return AssetImage("assets/day/D02.png");}
      break;
      case "03d":{return AssetImage("assets/day/D03.png");}
      break;
      case "04d":{return AssetImage("assets/day/D04.png");}
      break;
      case "09d":{return AssetImage("assets/day/D09.png");}
      break;
      case "10d":{return AssetImage("assets/day/D10.png");}
      break;
      case "11d":{return AssetImage("assets/day/D11.png");}
      break;
      case "13d":{return AssetImage("assets/day/D13.png");}
      break;
      case "50d":{return AssetImage("assets/day/D50.png");}
      break;
      case "01n":{return AssetImage("assets/night/N01.png");}
      break;
      case "02n":{return AssetImage("assets/night/N02.png");}
      break;
      case "03n":{return AssetImage("assets/night/N03.png");}
      break;
      case "04n":{return AssetImage("assets/night/N04.png");}
      break;
      case "09n":{return AssetImage("assets/night/N09.png");}
      break;
      case "10n":{return AssetImage("assets/night/N10.png");}
      break;
      case "11n":{return AssetImage("assets/night/N11.png");}
      break;
      case "13n":{return AssetImage("assets/night/N13.png");}
      break;
      case "50n":{return AssetImage("assets/night/N50.png");}
      break;
    }
  }
}
