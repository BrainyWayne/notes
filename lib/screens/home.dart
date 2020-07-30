import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notes/globalwidgets.dart';
import 'package:notes/screens/featuredDetails.dart';
import 'package:notes/screens/menu.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      darkMode = WidgetsBinding.instance.window.platformBrightness
              .toString()
              .contains("dark")
          ? true
          : false;

      setState(() {});
    }
  }

  List<PaletteColor> colors;
  Color domininant = Colors.red;

  List<String> imageCaption = [
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed",
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed",
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed"
  ];

  String title = "not";
  String title2 = "ed";
  IconData icon1 = Icons.menu;
  IconData icon2 = Icons.details;

  //Bottombar variables
  Color homeColor = Colors.red;
  Color settingsColor = darkMode ? Colors.black : Colors.white;
  Color addColor = darkMode ? Colors.black : Colors.white;
  Color cartColor = darkMode ? Colors.black : Colors.white;
  String homeText = "Home";
  String cartText = "";
  String addText = "";
  String settingsText = "";

  double pinnedHeight = 350;
  double pinnedOpacity = 1;
  IconData pinnedArrow = Icons.keyboard_arrow_down;
  double notesOpacity = 1;
  double newNoteOpacity = 0;

  ScrollController _scrollController;
  double bottonOpacity = 1;
  double newNoteHeight = 0;

  String noteTitle = "";
  String note = "";

  double moreOpacity =  0;
  double closeOpacity = 0;

  @override
  void initState() {
    awaitInit();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 70),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            AnimatedOpacity(
                              opacity: notesOpacity,
                              duration: Duration(milliseconds: 300),
                              child: AnimatedContainer(child: _notes(), duration: Duration(milliseconds: 400),),
                            ),
                            AnimatedOpacity(
                              opacity: newNoteOpacity,
                              duration: Duration(milliseconds: 300),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                height: newNoteHeight,
                                child: Container(
                                  color: darkMode ? Colors.black : Colors.white,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: _newNote(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),

        Container(
          decoration: BoxDecoration(
            color: darkMode ? Colors.black : Colors.white,
          ),
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: SafeArea(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          if(notesOpacity == 0){
                            notesOpacity = 1;
                            newNoteOpacity = 0;
                            title = "not";
                            title2 = "ed";
                            newNoteHeight = 0;
                            icon1 = Icons.menu;
                            moreOpacity = 0;
                            closeOpacity = 0;
                            setState(() {

                            });
                          } else{
                            showCupertinoModalBottomSheet(
                              expand: false,
                              context: context,
                              builder: (context, scrollController) => Material(child: Menu()),
                            );
                          }
                        },
                        child: Icon(
                          icon1,
                          size: 20,
                        )),
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 22, fontFamily: "nunitobold", color: colorBig),
                        ),
                        Text(
                          title2,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: colorBottom,
                              fontFamily: "nunitobold"),
                        ),
                      ],
                    ),
                    Icon(
                      icon2,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),


            Positioned(
              bottom: 20,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: bottonOpacity,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: moreOpacity,
                        duration: Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            if (notesOpacity == 1) {
                              notesOpacity = 0;
                              newNoteOpacity = 1;
                              title = "new ";
                              title2 = "note";
                              newNoteHeight = MediaQuery.of(context).size.height;
                              icon1 = Icons.arrow_back;
                            } else {
                              notesOpacity = 1;
                              newNoteOpacity = 0;
                              title = "not";
                              title2 = "ed";
                              newNoteHeight = 0;
                              icon1 = Icons.menu;
                            }

                            setState(() {});
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: colorBottom,
                                borderRadius: BorderRadius.circular(200)),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: () {
                          if (notesOpacity == 1) {
                            notesOpacity = 0;
                            newNoteOpacity = 1;
                            title = "new ";
                            title2 = "note";
                            newNoteHeight = MediaQuery.of(context).size.height;
                            icon1 = Icons.arrow_back;
                          } else {
                            notesOpacity = 1;
                            newNoteOpacity = 0;
                            title = "not";
                            title2 = "ed";
                            newNoteHeight = 0;
                            icon1 = Icons.menu;
                          }

                          setState(() {});
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: colorBottom,
                              borderRadius: BorderRadius.circular(200)),
                          child: Icon(Icons.add),
                        ),
                      ),
                      SizedBox(width: 20,),
                      AnimatedOpacity(
                        opacity: closeOpacity,
                        duration: Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            if (notesOpacity == 1) {
                              notesOpacity = 0;
                              newNoteOpacity = 1;
                              title = "new ";
                              title2 = "note";
                              newNoteHeight = MediaQuery.of(context).size.height;
                              icon1 = Icons.arrow_back;
                              moreOpacity = 1;
                              closeOpacity = 1;
                            } else {
                              notesOpacity = 1;
                              newNoteOpacity = 0;
                              title = "not";
                              title2 = "ed";
                              newNoteHeight = 0;
                              icon1 = Icons.menu;
                              moreOpacity = 0;
                              closeOpacity = 0;
                            }

                            setState(() {});
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: colorBottom,
                                borderRadius: BorderRadius.circular(200)),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  Future<Color> getImagePallete(String imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(AssetImage(imageProvider));

    domininant = paletteGenerator.dominantColor.color;
    setState(() {});
    return paletteGenerator.dominantColor.color;
  }

  void bottomBarSelection(int i) {
    if (i == 0) {
      homeColor = Colors.red.withOpacity(1);
      homeText = "Home";

      cartColor = Colors.transparent;
      cartText = "";
      addColor = Colors.transparent;
      addText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }
    if (i == 1) {
      cartColor = Colors.red.withOpacity(1);
      cartText = "Cart";

      homeColor = Colors.transparent;
      homeText = "";
      addColor = Colors.transparent;
      addText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }
    if (i == 2) {
      addColor = Colors.red.withOpacity(1);
      addText = "Add";

      homeColor = Colors.transparent;
      homeText = "";
      cartColor = Colors.transparent;
      cartText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }

    if (i == 3) {
      settingsColor = Colors.red.withOpacity(1);
      settingsText = "Settings";

      homeColor = darkMode ? Colors.black : Colors.white;
      homeText = "";
      addColor = darkMode ? Colors.black : Colors.white;
      addText = "";
      cartColor = darkMode ? Colors.black : Colors.white;
      cartText = "";

      setState(() {});
    }
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

  Widget _notes() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pinned",
                style: TextStyle(
                    fontSize: 19, fontFamily: "nunitobold", color: colorBig),
              ),
              GestureDetector(
                onTap: () {
                  if (pinnedOpacity == 1) {
                    pinnedOpacity = 0;
                    pinnedHeight = 0;
                    pinnedArrow = Icons.keyboard_arrow_right;
                    setState(() {});
                  } else {
                    pinnedOpacity = 1;
                    pinnedHeight = 350;
                    pinnedArrow = Icons.keyboard_arrow_down;
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(pinnedArrow),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: pinnedHeight,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
            opacity: pinnedOpacity,
            child: Column(
              children: [
                Container(
                  //height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GRE Test Prep",
                          style:
                              TextStyle(fontSize: 30, fontFamily: "nunitobold"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "• Selection of schools",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "nunito"),
                              ),
                              Text(
                                "• Become a member of EducationUSA by paying Ghs300",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "nunito"),
                              ),
                              Text(
                                "• Selection of schools",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "nunito"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.35),
                      ),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 120,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.35),
                      ),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 120,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notes",
                style: TextStyle(
                    fontSize: 19, fontFamily: "nunitobold", color: colorTop),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Solution Challenge Deliverables $i",
                      style: TextStyle(fontSize: 18, fontFamily: "nunitobold"),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Monday | No Additional Text",
                      style: TextStyle(fontFamily: "nunito"),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _newNote(){
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateTime.now().toString().split(" ")[0] , style: TextStyle(fontFamily: "nunito"),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Title", style: TextStyle(fontFamily: "nunitobold"),),
                ],
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: ((value){
                  noteTitle = value;
                }),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Note", style: TextStyle(fontFamily: "nunitobold"),),
                ],
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: ((value){
                  note = value;
                }),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        bottonOpacity = 1;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        bottonOpacity = 0;
      });
    }
  }
}
