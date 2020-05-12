import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectbusywork/myColors.dart';
import 'intro.dart';
import 'package:path_provider/path_provider.dart';
import 'home_widget.dart';
import 'placeholder_widget.dart';

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
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  List<dynamic> fileContent;

  @override
  void initState() {
    first = Home();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (!fileExists) first = IntroScreen();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busy Work',
      theme: ThemeData.dark(),
      home: first,
    );
  }
}
