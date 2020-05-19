import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
//import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/tasks.dart';
import 'myColors.dart';
import 'credits_widget.dart';
import 'package:path_provider/path_provider.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsWidget> {
  // final Color color;
  // final String text;
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  List<dynamic> fileContent;
  List<Task> allTasks = List<Task>();

  void initState() {
    super.initState();
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
        });
      });
    });
  }

  Future<List<Task>> getTasks() async {
    var addTasks = List<Task>();
    var tasksJson = json.decode(jsonFile.readAsStringSync());
    for (var taskJson in tasksJson) {
      addTasks.add(Task.fromJson(taskJson));
    }
    return addTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*RaisedButton(
              child: Text('Import'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {},
            ),
            */
            RaisedButton(
              child: Text('Export'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {
                _showDialog();
              },
            ),
            RaisedButton(
              child: Text('Credits'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditsWidget(bgGreen)));
              },
            ),
          ],
        ),
      ),
      backgroundColor: bgGreen,
    );
  }

  getCsv() async {
    //create an element rows of type list of list. All the above data set are stored in associate list
//Let associate be a model class with attributes name,gender and age and allTasks be a list of associate model class.

    List<List<dynamic>> rows = List<List<dynamic>>();
    for (int i = 0; i < allTasks.length; i++) {
//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = List();
      row.add(allTasks[i].id);
      row.add(allTasks[i].title);
      row.add(allTasks[i].location);
      row.add(allTasks[i].description);
      row.add(allTasks[i].date);
      row.add(allTasks[i].startTime);
      row.add(allTasks[i].endTime);
      row.add(allTasks[i].routine);
      row.add(allTasks[i].actualStart);
      row.add(allTasks[i].actualEnd);
      row.add(allTasks[i].expected);
      row.add(allTasks[i].completed);
      rows.add(row);
    }

    getExternalStorageDirectory().then((Directory directory) {
      Directory dir2 = directory;
      File csvFile = new File(dir2.path + "/" + "plannerExport.csv");
// convert rows to String and write as csv file

      String csv = const ListToCsvConverter().convert(rows);
      csvFile.writeAsString(csv);
      // }
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Export"),
          content: new Text("Export CSV to SDcard>Android>busywork>files"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Accept"),
              onPressed: () {
                getCsv();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
