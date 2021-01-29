import 'package:flutter/material.dart';

import 'LoadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
    // return NeumorphicApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   themeMode: ThemeMode.light,
    //   theme: NeumorphicThemeData(
    //     baseColor: Color(0xFFFFFFFF),
    //     lightSource: LightSource.topLeft,
    //     depth: 10,
    //   ),
    //   darkTheme: NeumorphicThemeData(
    //     baseColor: Color(0xFF3E3E3E),
    //     lightSource: LightSource.topLeft,
    //     depth: 6,
    //   ),
    //   home: LoadingScreen(),
    //   // highContrastTheme: ThemeData.dark(),
    // );
  }
}
