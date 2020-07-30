import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // additional settings go here
      ),
      home: MyHomePage(),
    );
  }
}

bool darkMode = true;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;





  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    darkMode = WidgetsBinding.instance.window.platformBrightness.toString().contains("dark") ? true : false;




  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      darkMode = WidgetsBinding.instance.window.platformBrightness.toString().contains("dark") ? true : false;
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home()
    );
  }
}
