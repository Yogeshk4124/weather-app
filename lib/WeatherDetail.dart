import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    Key key,
    @required this.wind,
    @required this.humidity,
    @required this.pressure,
    @required this.visibility,
  }) : super(key: key);

  final double wind;
  final int humidity;
  final int pressure;
  final int visibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              wind.toString() + ' km/h',
              style: GoogleFonts.dosis(fontSize: 26),
            ),
            Text(
              'Wind',
              style: GoogleFonts.dosis(fontSize: 16),
            ),
            SizedBox.fromSize(
              size: Size(0, 10),
            ),
            Text(
              humidity.toString() + ' %',
              style: GoogleFonts.dosis(fontSize: 26),
            ),
            Text(
              'Humidity',
              style: GoogleFonts.dosis(fontSize: 16),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              pressure.toString() + 'mb',
              style: GoogleFonts.dosis(fontSize: 26),
            ),
            Text(
              'Pressure',
              style: GoogleFonts.dosis(fontSize: 16),
            ),
            SizedBox.fromSize(
              size: Size(0, 10),
            ),
            Text(
              visibility.toString() + ' km',
              style: GoogleFonts.dosis(fontSize: 26),
            ),
            Text(
              'Visibility',
              style: GoogleFonts.dosis(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
