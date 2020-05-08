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

// File jsonFile;
// Directory dir;
// String fileName = "tasks.json";
// bool fileExists = false;
// List<dynamic> fileContent;
// @override
// void initState() {
//   getApplicationDocumentsDirectory().then((Directory directory) {
//     dir = directory;
//     jsonFile = new File(dir.path + "/" + fileName);
//     fileExists = jsonFile.existsSync();
//   });
// }

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
}

//this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
