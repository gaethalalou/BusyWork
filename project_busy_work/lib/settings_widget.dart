import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/tasks.dart';
import 'myColors.dart';
import 'credits_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

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
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.import_export, size: 25, color: lGreen),
                    Text(
                      ' Import',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: lGreen),
                    ),
                  ],
                ),
                onPressed: () {
                  csvToJson();
                },
                splashColor: Colors.grey[500],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.import_export, size: 25, color: lGreen),
                    Text(
                      ' Export',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: lGreen),
                    ),
                  ],
                ),
                onPressed: () {
                  _showDialog();
                },
                splashColor: Colors.grey[500],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: lGreen,
                    ),
                    Text(
                      ' Reset All Tasks',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: lGreen),
                    ),
                  ],
                ),
                onPressed: () {
                  _deleteJSON();
                },
                splashColor: Colors.grey[500],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info_outline, color: lGreen),
                    Text(
                      ' About Us',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: lGreen),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreditsWidget(bgGreen)));
                },
                splashColor: Colors.grey[500],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
      //row.add(allTasks[i].id);
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
          content: new Text(
              "Would you like to export your tasks as a CSV? \nThe path for the CSV will be: \nSDcard>Android>busywork>files"),
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

  void _deleteJSON() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Would you like to delete all of your tasks?"),
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
                deleteTasks();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteTasks() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        jsonFile.deleteSync();
      }
    });
  }

  void csvToJson() async {
    File file = await FilePicker.getFile(
        type: FileType.custom, allowedExtensions: ['csv', 'xlsx']);
    String csvFile = file.readAsStringSync();
    var uuid = new Uuid();
    var res = const CsvToListConverter(eol: '\n').convert(csvFile);
    for (int i = 0; i < res.length; i++) {
      res[i].insert(0, uuid.v5(Uuid.NAMESPACE_OID,
          res[i][3] + res[i][0] + res[i][4]),);
      Task t = new Task(
        id: res[i][0],
        title: res[i][1],
        description: res[i][2],
        location: res[i][3],
        date: res[i][4],
        startTime: res[i][5],
        endTime: res[i][6],
        routine: res[i][7],
        expected: res[i][8],
        actualEnd: res[i][9],
        actualStart: res[i][10],
        completed: res[i][11],
      );
      writeToFile(t);
    }
  }

  void writeToFile(dynamic value) {
    if (fileExists) {
      List<dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.add(value);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
  }
}
