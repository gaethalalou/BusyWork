import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectbusywork/Logo_widget.dart';
import 'package:projectbusywork/myColors.dart';

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
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busy Work',
      theme: ThemeData.dark(),
      home: LogoWidget(bgGreen),
    );
  }
}
