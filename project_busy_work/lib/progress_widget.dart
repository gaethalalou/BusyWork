import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:projectbusywork/myColors.dart';
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
  List<charts.Series<Info, String>> seriesData =
      List<charts.Series<Info, String>>();

  void initState() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      this.setState(
          () => fileContent = json.decode(jsonFile.readAsStringSync()));

      getTasks().then((value) {
        setState(() {
          allTasks.addAll(value);
          print(allTasks);
          seriesData = List<charts.Series<Info, String>>();
          generateData();
        });
      });
    });
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
                'Expected vs. Actual',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Container(height: 10),
              Text(
                'Weekly Report',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 200.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: charts.BarChart(
                  seriesData,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  behaviors: [new charts.SeriesLegend(
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.black87),
                      )
                  )],
                  animationDuration: Duration(seconds: 1),
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
    int expSunday = 0;
    int actSunday = 0;
    int expMonday = 0;
    int actMonday = 0;
    int expTuesday = 0;
    int actTuesday = 0;
    int expWednesday = 0;
    int actWednesday = 0;
    int expThursday = 0;
    int actThursday = 0;
    int expFriday = 0;
    int actFriday = 0;
    int expSaturday = 0;
    int actSaturday = 0;
    for (var task in allTasks) {
      if (task.completed == "true") {
        String realWeekDay = task.weekDay;
        List<String> hm = task.expected.split(":");
        int hour = int.parse(hm[0]);
        int minute = int.parse(hm[1]);
        int expectedMinutes = minute;
        for (int i = 0; i < hour; i++) expectedMinutes = expectedMinutes + 60;

        List<String> hm2 = task.actualStart.split(":");
        int hour2 = int.parse(hm2[0]);
        int minute2 = int.parse(hm2[1]);
        int actualMinutes = minute2;
        for (int i = 0; i < hour2; i++) actualMinutes = actualMinutes + 60;

        if (realWeekDay == "Sunday") {
          expSunday = expSunday + expectedMinutes;
          actSunday = actSunday + actualMinutes;
        }

        if (realWeekDay == "Monday") {
          expMonday = expMonday + expectedMinutes;
          actMonday = actMonday + actualMinutes;
        }

        if (realWeekDay == "Tuesday") {
          expTuesday = expTuesday + expectedMinutes;
          actTuesday = actTuesday + actualMinutes;
        }

        if (realWeekDay == "Wednesday") {
          expWednesday = expWednesday + expectedMinutes;
          actWednesday = actWednesday + actualMinutes;
        }

        if (realWeekDay == "Thursday") {
          expThursday = expThursday + expectedMinutes;
          actThursday = actThursday + actualMinutes;
        }

        if (realWeekDay == "Friday") {
          expFriday = expFriday + expectedMinutes;
          actFriday = actFriday + actualMinutes;
        }

        if (realWeekDay == "Saturday") {
          expFriday = expSaturday + expectedMinutes;
          actSaturday = actSaturday + actualMinutes;
        }
      }
    }
    var expData = [
      new Info("Sun", "expected", expSunday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Mon", "expected", expMonday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Tues", "expected", expTuesday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Wed", "expected", expWednesday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Thurs", "expected", expThursday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Fri", "expected", expFriday,
          charts.ColorUtil.fromDartColor(lGreen)),
      new Info("Sat", "expected", expSaturday,
          charts.ColorUtil.fromDartColor(lGreen)),
    ];

    var actData = [
      new Info("Sun", "actual", actSunday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Mon", "actual", actMonday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Mon", "actual", actMonday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Tues", "actual", actTuesday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Wed", "actual", actWednesday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Thurs", "actual", actThursday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Fri", "actual", actFriday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
      new Info("Sat", "actual", actSaturday,
          charts.ColorUtil.fromDartColor(Colors.grey)),
    ];

    seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.title,
        measureFn: (Info info, _) => info.time,
        colorFn: (Info info, _) => info.color,
        id: "Expected",
        data: expData,
        displayName: "Expected",
        //labelAccessorFn: (Info info, _) => info.actual,
      ),
    );

    seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.title,
        measureFn: (Info info, _) => info.time,
        colorFn: (Info info, _) => info.color,
        id: "Actual",
        data: actData,
        displayName: "Actual",
        //labelAccessorFn: (Info info, _) => info.actual,
      ),
    );
  }
}

class Info {
  String title;
  String actual;
  int time;
  charts.Color color;
  Info(this.title, this.actual, this.time, this.color);
}
