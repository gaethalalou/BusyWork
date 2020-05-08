import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/overview_widget.dart';
import 'DescriptionPage.dart';
import 'myColors.dart';
import 'package:path_provider/path_provider.dart';

Task userFromJson(String str) => Task.fromJson(json.decode(str));

String userToJson(Task data) => json.encode(data.toJson());

File jsonFile;
Directory dir;
String fileName = "tasks.json";
bool fileExists = false;
List<dynamic> fileContent;
@override
void initState() {
  getApplicationDocumentsDirectory().then((Directory directory) {
    dir = directory;
    jsonFile = new File(dir.path + "/" + fileName);
    fileExists = jsonFile.existsSync();
  });
}

class Task {
  String title;
  String location;
  String description;
  String date;
  String startTime;
  String endTime;
  String routine;
  String actualStart;
  String actualEnd;
  String expected;
  String completed;

  Task({
    this.title,
    this.location,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.routine,
    this.actualStart,
    this.actualEnd,
    this.expected,
    this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      title: json["title"],
      location: json["location"],
      description: json["description"],
      date: json["date"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      routine: json["routine"],
      actualStart: json["actualStart"],
      actualEnd: json["actualEnd"],
      expected: json["expected"],
      completed: json["completed"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "description": description,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "routine": routine,
        "actualStart": actualStart,
        "actualEnd": actualEnd,
        "expected": expected,
        "completed": completed,
      };

  Widget buildTitle(BuildContext context) => Card(
        elevation: 2.0,
        child: ListTile(
          trailing: IconButton(
            onPressed: () {
              if (completed == "false") {
                writeToFileComp(title, "true");
              } else {
                writeToFileComp(title, "false");
              }
            },
            icon: Icon(Icons.check_circle_outline),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DescriptionPage(
                        desc: description,
                        title: title,
                        location: location,
                        startTime: startTime,
                        date: date,
                        routine: routine,
                        endTime: endTime,
                        expected: expected,
                      )),
            );
          },
          title: completed == "false"
              ? Text(title)
              : Text(title,
                  style: TextStyle(decoration: TextDecoration.lineThrough)),
          subtitle: Text(description +
              " • Expected: " +
              expected +
              (actualStart != "TBD" ? " • Actual: " + actualStart : "")),
        ),
        color: lGreen,
        margin: EdgeInsets.only(top: 0.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0)),
      );
}

void writeToFileComp(String title, dynamic value) {
  List<dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
  for (var i = 0; i < jsonFileContent.length; i++) {
    if (jsonFileContent[i]["title"] == title) {
      jsonFileContent[i]["completed"] = value;
    }

    // jsonFileContent.add(value);
    jsonFile.writeAsStringSync(json.encode(jsonFileContent));
  }

  //this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
}
