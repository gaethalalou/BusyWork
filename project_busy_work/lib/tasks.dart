import 'dart:convert';

Task userFromJson(String str) => Task.fromJson(json.decode(str));

String userToJson(Task data) => json.encode(data.toJson());

class Task {
  String id;
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
    this.id,
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
      id: json["id"],
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
        "id": id,
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
