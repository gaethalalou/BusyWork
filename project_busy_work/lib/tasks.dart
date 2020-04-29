import 'dart:convert';

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

  Task(
      {this.title,
      this.location,
      this.description,
      this.date,
      this.startTime,
      this.endTime,
      this.routine});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"],
        location: json["location"],
        description: json["description"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        routine: json["routine"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "description": description,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "routine": routine
      };
}
