import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Result extends StatefulWidget {
  Result({@required this.weatherData});
  final weatherData;
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double temp;
  int humidity;
  String description;
  List<dynamic> hourly;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    temp = weatherData['current']['temp'];
    humidity = weatherData['current']['humidity'];
    description = weatherData['current']['weather'][0]['description'];
    hourly = weatherData['hourly'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff6EF9E6),
      backgroundColor: Color(0xffd6d6d6),
      // backgroundColor: NeumorphicTheme.baseColor(context),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 25,
                      color: Color(0xff2F2E62),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2F2E62),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: Image(
                      alignment: Alignment.center,
                      image: AssetImage("assets/day/D50.png"),
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Cloudy',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2F2E62),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    '28',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2F2E62),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('Wind:98.2'), Text('humidity:47')],
              ),

              // for(int i=0;i<hourly.length;i++){
              //
              // }
              Container(
                  height: 154,
                  width: 154,
                  decoration: BoxDecoration(
                      color: Color(0xffd6d6d6),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: Color(0xffc7c7c7),
                          offset: Offset(
                            15,
                            15,
                          ),
                        ),
                        BoxShadow(
                          blurRadius: 30,
                          color: Color(0xffe5e5e5),
                          offset: Offset(
                            -15,
                            -15,
                          ),
                        ),
                      ],
                      gradient: LinearGradient(
                        stops: [0, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:
                        [Color(0xffc1c1c1), Color(0xffe5e5e5)],
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(
                            21,
                          )
                      )
                  ),
                child: Column(
                  children: <Widget>[
                    Text('cool',
                    style: TextStyle(),
                    ),
                    Icon(
                      Icons.ac_unit,
                    ),
                    Text('28'),
                  ],
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
