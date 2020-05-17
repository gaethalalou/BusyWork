import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectbusywork/Logo_widget.dart';
import 'package:projectbusywork/myColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro.dart';
import 'home_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Widget first;

  @override
  void initState() {
    first = LogoWidget(bgGreen);
    boolChecker();
    super.initState();
  }

  Future<void> boolChecker() async {
    final prefs = await SharedPreferences.getInstance();
    final startupBool = prefs.getBool('startupBool');
    print("startupBool: " + startupBool.toString());
    if (startupBool == null) {
      first = IntroScreen();
      await prefs.setBool('startupBool', true);
    } else {
      first = Home();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busy Work',
      theme: ThemeData.dark(),
      home: first,
    );
  }
}
