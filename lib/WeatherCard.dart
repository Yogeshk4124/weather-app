import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  final String temp, id, dt, time;

  WeatherCard(
      {@required this.temp,
      @required this.time,
      @required this.id,
      @required this.dt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          dt,
          style:
              GoogleFonts.poiretOne(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Container(
          height: 154,
          width: 154,
          margin: EdgeInsets.only(top: 20, bottom: 40, left: 10, right: 10),
          child: Card(
            color: Color(0x111D212C),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  time,
                  style: GoogleFonts.signika(fontSize: 20),
                ),
                Icon(
                  Icons.ac_unit,
                  size: 60,
                ),
                Text(
                  temp,
                  style: GoogleFonts.signika(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
