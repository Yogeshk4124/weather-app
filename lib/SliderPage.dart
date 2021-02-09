import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/WeatherDetail.dart';
import 'WeatherCard.dart';

class SliderPage extends StatefulWidget {
  final dynamic hourly;
  final weatherData;

  SliderPage({@required this.hourly, this.weatherData});

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int selected = -1;
  dynamic weatherData;
  double wind;
  int temp;
  int pressure, humidity, visibility;
  String description;

  // SliderPage({@required this.hourly});
  void initState() {
    weatherData = widget.weatherData;
  }

  String solve(int time) {
    DateTime d = DateTime.fromMillisecondsSinceEpoch(time);
    return new DateFormat.MMMEd().format(d);
  }

  String getTime(int time) {
    DateTime d = DateTime.fromMillisecondsSinceEpoch(time);
    // print(d.toString());
    return new DateFormat.jm().format(d);
  }

  getCurrentData(int i) {
    humidity = weatherData['hourly'][i]['humidity'];
    wind = weatherData['hourly'][i]['wind_speed'];
    visibility = weatherData['hourly'][i]['visibility'];
    pressure = weatherData['hourly'][i]['pressure'];
    description = weatherData['hourly'][i]['weather'][0]['description'];
    temp = weatherData['hourly'][i]['temp'].round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xdd1D212C),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (var i = 0; i < widget.hourly.length; i++)
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        selected = i;
                        getCurrentData(i);
                      }),
                    },
                    child: WeatherCard(
                      temp: widget.hourly[i]['temp'].round().toString(),
                      time: getTime(widget.hourly[i]['dt'] * 1000),
                      id: widget.hourly[i]['weather'][0]['id'].toString(),
                      dt: solve(widget.hourly[i]['dt'] * 1000).toString(),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              if (selected == -1)
                Text(
                  'Please select to display text',
                  style:  GoogleFonts.signika(fontSize: 20),
                )
              else
                WeatherDetail(
                    wind: wind,
                    humidity: humidity,
                    pressure: pressure,
                    visibility: visibility)
            ],
          ),
        ],
      ),
    );
  }
}
