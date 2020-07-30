import 'dart:async';


import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

bool darkMode = true;
String colorModeSettings = "grey";



class _SplashState extends State<Splash> {
  bool firsttime = true;
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {

      checkDarkMode();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: darkMode ? Colors.black : Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset("ass", height: 200, width: 200,color: darkMode ? Colors.white : Colors.black,)
          )),
    );
  }




  void checkDarkMode() {
    print(WidgetsBinding.instance.window.platformBrightness);

    if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
      darkMode = true;
    } else if (WidgetsBinding.instance.window.platformBrightness ==
        Brightness.light) {
      darkMode = false;
    }


  }


}
