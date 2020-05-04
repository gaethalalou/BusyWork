import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DescriptionPage.dart';
import 'myColors.dart';

Task userFromJson(String str) => Task.fromJson(json.decode(str));

String userToJson(Task data) => json.encode(data.toJson());

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
      );

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
      };

  Widget buildTitle(BuildContext context) => Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DescriptionPage(desc: description)),
            );
          },
          title: Text(title),
          subtitle: Text(description +
              " • Expected: " +
              startTime +
              (actualStart != "" ? " • Actual: " + actualStart : "")),
        ),
        color: lGreen,
        margin: EdgeInsets.only(top: 5.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        // shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 100)),
        // foregroundColor: lGreen,
        // backgroundColor: bgWhite,
      );
}
