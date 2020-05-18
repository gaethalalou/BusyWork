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
  List<charts.Series<Info, String>> seriesData;

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

    seriesData = List<charts.Series<Info, String>>();
    generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Tasks Comparison',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(
                  seriesData,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  //behaviors: [new charts.SeriesLegend()],
                  animationDuration: Duration(seconds: 5),
                ),
              ),
            ],
          ),
        ),
      ),
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

  void generateData() {
    for (var task in allTasks) {
      print("I exist!");

      if (task.completed == "true") {
        print("We did it!");
        var data = [
          new Info(task.title, "expected", 20),
          new Info(task.title, "actual", 30),
        ];

        seriesData.add(
          charts.Series(
            domainFn: (Info info, _) => info.title,
            measureFn: (Info info, _) => info.time,
            id: task.title + task.date + task.expected,
            data: data,
            fillPatternFn: (_, __) => charts.FillPatternType.solid,
            fillColorFn: (Info info, _) =>
                charts.ColorUtil.fromDartColor(Color(0xff990099)),
          ),
        );
      }
    }
  }
}

class Info {
  String title;
  String actual;
  int time;
  Info(this.title, this.actual, this.time);
}
