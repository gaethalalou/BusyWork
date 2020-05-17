import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:projectbusywork/tasks.dart';

class ProgressWidget extends StatefulWidget {
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return ProgressWidgetState();
  }

  ProgressWidget(this.color);
}

class ProgressWidgetState extends State<ProgressWidget> {
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  List<dynamic> fileContent;
  List<Task> allTasks = List<Task>();

  void initState() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      this.setState(
          () => fileContent = json.decode(jsonFile.readAsStringSync()));

      getTasks().then((value) {
        setState(() {
          allTasks.addAll(value);
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Currently in development!",
              style: TextStyle(fontSize: 16))),
      backgroundColor: widget.color,
    );
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
