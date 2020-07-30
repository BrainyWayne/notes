import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

Color colorBig = Colors.grey;
Color colorTop = Colors.grey;
Color colorBottom = Colors.grey;

double colorRampOpacity = 0;
double colorRampHeight = 0;
SharedPreferences sharedPreferences;
String colorModeSettings = "grey";

class _MenuState extends State<Menu> {



  @override
  void initState() {
    awaitInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkMode ? Colors.black : Colors.white,
      height: MediaQuery.of(context).size.height - 80,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                //height: 100,
                // width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/images/img0.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Francis Eshun",
                style: TextStyle(fontSize: 22, fontFamily: "nunitoextra"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "eshunfrancisboateng@gmail.com",
                style: TextStyle(fontSize: 17, fontFamily: "nunitobold"),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Color mode",
                    style: TextStyle(fontFamily: "nunito"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (colorRampOpacity == 1) {
                    colorRampHeight = 0;
                    colorRampOpacity = 0;
                    setState(() {});
                  } else {
                    colorRampOpacity = 1;
                    colorRampHeight = 60;
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current color mode",
                              style: TextStyle(fontFamily: "nunitobold"),
                            ),
                            Text(
                              sharedPreferences.getString("colorMode"),
                              style: TextStyle(fontFamily: "nunito"),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(color: colorTop),
                                ),
                                Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(color: colorBottom),
                                ),
                              ],
                            ),
                            Container(
                              width: 50,
                              height: 60,
                              decoration: BoxDecoration(
                                color: colorBig,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              AnimatedContainer(
                height: colorRampHeight,
                duration: Duration(milliseconds: 300),
                child: AnimatedOpacity(
                  opacity: colorRampOpacity,
                  duration: Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("multi");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 15,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor: Colors.green,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("red");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("yellow");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("green");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("blue");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("purple");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setColorMode("grey");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Edit profile",
                    style: TextStyle(fontFamily: "nunito"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "eshunfrancisboateng",
                            style: TextStyle(fontFamily: "nunitobold"),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> awaitInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("colorMode") == null) {
      sharedPreferences.setString("colorMode", "grey");
    } else {
      if (sharedPreferences.getString("colorMode") == "multi") {
        setState(() {
          colorBig = Colors.red;
          colorTop = Colors.yellow;
          colorBottom = Colors.green;
        });
      } else if (sharedPreferences.getString("colorMode") == "red") {
        setState(() {
          colorBig = Colors.red;
          colorTop = Colors.red;
          colorBottom = Colors.red;
        });
      } else if (sharedPreferences.getString("colorMode") == "yellow") {
        setState(() {
          colorBig = Colors.yellow;
          colorTop = Colors.yellow;
          colorBottom = Colors.yellow;
        });
      } else if (sharedPreferences.getString("colorMode") == "green") {
        setState(() {
          colorBig = Colors.green;
          colorTop = Colors.green;
          colorBottom = Colors.green;
        });
      } else if (sharedPreferences.getString("colorMode") == "blue") {
        setState(() {
          colorBig = Colors.blue;
          colorTop = Colors.blue;
          colorBottom = Colors.blue;
        });
      } else if (sharedPreferences.getString("colorMode") == "grey") {
        setState(() {
          colorBig = Colors.grey;
          colorTop = Colors.grey;
          colorBottom = Colors.grey;
        });
      } else if (sharedPreferences.getString("colorMode") == "purple") {
        setState(() {
          colorBig = Colors.purple;
          colorTop = Colors.purple;
          colorBottom = Colors.purple;
        });
      }
    }
  }

  void setColorMode(String color) {
    if (color == "multi") {
      colorBig = Colors.red;
      colorTop = Colors.yellow;
      colorBottom = Colors.green;
      setState(() {});
      sharedPreferences.setString("colorMode", "multi");
    }
    if (color == "red") {
      colorBig = Colors.red;
      colorTop = Colors.red;
      colorBottom = Colors.red;
      setState(() {});
      sharedPreferences.setString("colorMode", "red");
    }
    if (color == "yellow") {
      colorBig = Colors.yellow;
      colorTop = Colors.yellow;
      colorBottom = Colors.yellow;
      setState(() {});
      sharedPreferences.setString("colorMode", "yellow");
    }
    if (color == "green") {
      colorBig = Colors.green;
      colorTop = Colors.green;
      colorBottom = Colors.green;
      setState(() {});
      sharedPreferences.setString("colorMode", "green");
    }
    if (color == "blue") {
      colorBig = Colors.blue;
      colorTop = Colors.blue;
      colorBottom = Colors.blue;
      setState(() {});
      sharedPreferences.setString("colorMode", "blue");
    }
    if (color == "purple") {
      colorBig = Colors.purple;
      colorTop = Colors.purple;
      colorBottom = Colors.purple;
      setState(() {});
      sharedPreferences.setString("colorMode", "purple");
    }
    if (color == "grey") {
      colorBig = Colors.grey;
      colorTop = Colors.grey;
      colorBottom = Colors.grey;
      setState(() {});
      sharedPreferences.setString("colorMode", "grey");
    }

    colorModeSettings = sharedPreferences.getString("colorMode");
    setState(() {});
  }
}
