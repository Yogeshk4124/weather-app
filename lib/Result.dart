import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weatherapp/LoadingScreen.dart';
import 'package:weatherapp/SliderPage.dart';
import 'package:weatherapp/WeatherDataManipulator.dart';

import 'WeatherDetail.dart';

class Result extends StatefulWidget {
  Result({@required this.weatherData, @required this.area});

  final weatherData, area;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final panelController = PanelController();
  double wind;
  int temp;
  int pressure, id, humidity, visibility;
  String icon;
  String description, location;
  List<dynamic> hourly;
  int clicked = 0;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print("INSIDE "+widget.weatherData.toString());
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    id = weatherData['current']['weather'][0]['id'];
    temp = weatherData['current']['temp'].round();
    // print(temp.toString());
    location = weatherData['timezone'];
    icon = weatherData['current']['weather'][0]['icon'];
    humidity = weatherData['current']['humidity'];
    wind = weatherData['current']['wind_speed'];
    visibility = weatherData['current']['visibility'];
    pressure = weatherData['current']['pressure'];
    description = weatherData['current']['weather'][0]['description'];
    hourly = weatherData['hourly'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1D212C),
      body: SlidingUpPanel(
        backdropEnabled: true,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        maxHeight: MediaQuery.of(context).size.height - 350,
        panel: SliderPage(
          hourly: hourly,
          weatherData: widget.weatherData,
        ),
        collapsed: Container(
          width: MediaQuery.of(context).size.width - 350,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              'Show more',
              style: GoogleFonts.oswald(
                color: Color(0xff1D212C),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoadingScreen(
                                          apiType: 0,
                                        )));
                          },
                          child: Icon(
                            Icons.location_on,
                            size: 35,
                            color:  Color(0xff1D212C), //Color(0xff2F2E62)
                          ),
                        ),
                        if (clicked == 0)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1D212C),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                widget.area,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1D212C),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          )
                        else
                          Container(
                            alignment: FractionalOffset.center,
                            width: 200,
                            child: Center(
                              child: TextField(
                                controller: searchController,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '(Ex. New York, US)',
                                  hintStyle: TextStyle(
                                    color: Colors.black12,
                                  ),
                                  fillColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              if (clicked == 1) {
                                clicked = 0;
                                print('text'+searchController.text);
                                if (searchController.text != '') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoadingScreen(
                                                apiType: 1,
                                                place: searchController.text,
                                              )));
                                }
                              } else {
                                clicked = 1;
                              }
                            }),
                          },
                          child: Icon(
                            Icons.search,
                            size: 35,
                            color:  Color(0xff1D212C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  description[0].toUpperCase() + description.substring(1),
                  style: GoogleFonts.poiretOne(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Image(
                  alignment: Alignment.center,
                  image: WeatherDataManipulator(weatherData: widget.weatherData)
                      .getImage(icon),
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    temp.toString(),
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'oC',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFDCDCDC),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: WeatherDetail(
                    wind: wind,
                    humidity: humidity,
                    pressure: pressure,
                    visibility: visibility),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
