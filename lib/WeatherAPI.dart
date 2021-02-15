import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherAPI{
  String apikey="";
  Future callAPI(double lat,double lon) async{
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=alert,minutely,daily&appid=$apikey&units=metric');
    if(response.statusCode==200) {
      String data=(response.body);
      var decodedData=jsonDecode(data);
      return decodedData;
    }
    else print(response.statusCode);
  }

  Future callAreaAPI(double lat,double lon) async{
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    if(response.statusCode==200) {
      String data=(response.body);
      var decodedData=jsonDecode(data);
      return decodedData['name'];
    }
    else print(response.statusCode);
  }
  Future searchCallAPI(String place) async{
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?q=$place&appid=$apikey&units=metric');
    if(response.statusCode==200) {
      String data=(response.body);
      var decodedData=jsonDecode(data);
      return decodedData;
    }
    else print(response.statusCode);
  }

}
