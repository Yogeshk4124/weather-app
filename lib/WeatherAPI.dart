import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherAPI{
  String apikey="74d03fa36147c48fcc230cd738144e66";
  Future callAPI(double lat,double lon) async{
    print("here:"+lat.toString()+" "+lon.toString());
    // http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=alert,minutely,daily&appid=$apikey&units=metric');
    if(response.statusCode==200) {
      String data=(response.body);
      var decodedData=jsonDecode(data);
      return decodedData;
    }
    else print(response.statusCode);
  }
}