import 'package:flutter/material.dart';
import 'package:projectbusywork/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_widget.dart';

class LogoWidget extends StatefulWidget {
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return LogoWidgetState();
  }

  LogoWidget(this.color);
}

class LogoWidgetState extends State<LogoWidget> {
  @override
  void initState() {
    boolChecker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Insert Logo Here", style: TextStyle(fontSize: 16))),
      backgroundColor: widget.color,
    );
  }

  Future<void> boolChecker() async {
    final prefs = await SharedPreferences.getInstance();
    final startupBool = prefs.getBool('startupBool');
    print("startupBool: " + startupBool.toString());
    if (startupBool == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ));
      await prefs.setBool('startupBool', true);
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }
  }
}
