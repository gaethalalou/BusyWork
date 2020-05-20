import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projectbusywork/intro.dart';
import 'package:projectbusywork/myColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'tasks.dart';

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
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  List<dynamic> fileContent;
  List<Task> allTasks = List<Task>();

  @override
  void initState() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (!fileExists) {
        File file = new File(dir.path + "/" + fileName);
        file.createSync();
        fileExists = true;
        file.writeAsStringSync("[]");
      }
      this.setState(
          () => fileContent = json.decode(jsonFile.readAsStringSync()));

      getTasks().then((value) {
        setState(() {
          allTasks.addAll(value);
          print(allTasks);
          boolChecker();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
          margin: EdgeInsets.only(top: 100, bottom: 250),
          child:            
          new Image.asset(
              'assets/images/appLogo.png',
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          LinearProgressIndicator(backgroundColor: Colors.transparent, valueColor: new AlwaysStoppedAnimation<Color>(hGreen),),
        ],
      ),
      backgroundColor: widget.color,
    );
  }

  Future<void> boolChecker() async {
    final prefs = await SharedPreferences.getInstance();
    final startupBool = prefs.getBool('startupBool');
    print("startupBool: " + startupBool.toString());
    if (allTasks.length == 0) {
      await Future.delayed(Duration(seconds: 5));
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

  Future<List<Task>> getTasks() async {
    var addTasks = List<Task>();
    var tasksJson = json.decode(jsonFile.readAsStringSync());
    for (var taskJson in tasksJson) {
      addTasks.add(Task.fromJson(taskJson));
    }
    return addTasks;
  }
}
