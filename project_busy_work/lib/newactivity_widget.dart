import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/myColors.dart';
import 'home_widget.dart';
import 'tasks.dart';
import 'package:intl/intl.dart';

class NewActivityWidget extends StatefulWidget {
  @override
  NewActivityState createState() => NewActivityState();
}

class NewActivityState extends State<NewActivityWidget> {
  final titleKey = GlobalKey<FormState>();
  final locationKey = GlobalKey<FormState>();
  final descriptionKey = GlobalKey<FormState>();
  final dateKey = GlobalKey<FormState>();
  final timeKey = GlobalKey<FormState>();
  final routineKey = GlobalKey<FormState>();
  String title, location, description, date, time, routine;
  bool check = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime1 = DateTime.now();
  DateTime selectedTime2 = DateTime.now().add(Duration(minutes: 30));
  final DateFormat dated = DateFormat('yyyy-MM-dd');
  final DateFormat timed = DateFormat('HH : mm');
  List<Routines> routines = Routines.getRoutines();
  List<DropdownMenuItem<Routines>> dropdownMenuItems;
  Routines selectedRoutine;
  String period1;
  String period2;

  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  List<dynamic> fileContent;

  @override
  void initState() {
    noonCheck1(selectedTime1);
    noonCheck2(selectedTime2);
    setState(() {
      if (TimeOfDay.fromDateTime(selectedTime1).hourOfPeriod != 0) {
        selectedTime1 = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            TimeOfDay.fromDateTime(selectedTime1).hourOfPeriod,
            selectedTime1.minute);
      } else {
        selectedTime1 = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, selectedTime1.minute);
      }

      if (TimeOfDay.fromDateTime(selectedTime2).hourOfPeriod != 0) {
        selectedTime2 = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            TimeOfDay.fromDateTime(selectedTime2).hourOfPeriod,
            selectedTime2.minute);
      } else {
        selectedTime2 = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, selectedTime2.minute);
      }
    });
    dropdownMenuItems = buildDropdownMenuItems(routines);
    selectedRoutine = dropdownMenuItems[0].value;
    super.initState();

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  List<DropdownMenuItem<Routines>> buildDropdownMenuItems(List routines) {
    List<DropdownMenuItem<Routines>> items = List();
    for (Routines routine in routines) {
      items.add(
        DropdownMenuItem(
          value: routine,
          child: Text(routine.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: hGreen,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Text("New Activity", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Title: ', style: TextStyle(fontSize: 22)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      key: titleKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert title.'
                                  : null,
                              onSaved: (input) => title = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Location: ', style: TextStyle(fontSize: 22)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      key: locationKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert location.'
                                  : null,
                              onSaved: (input) => location = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Description: ', style: TextStyle(fontSize: 22)),
                Container(width: 20),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      key: descriptionKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert description.'
                                  : null,
                              onSaved: (input) => description = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Date: ', style: TextStyle(fontSize: 22)),
                Container(width: 90),
                Column(
                  children: <Widget>[
                    Text(dated.format(selectedDate)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Select Date"),
                      color: hGreen,
                      onPressed: () async {
                        final selectedDate = await selectDate(context);
                        if (selectedDate == null) return;

                        setState(
                          () {
                            this.selectedDate = DateTime(selectedDate.year,
                                selectedDate.month, selectedDate.day);
                          },
                        );
                      },
                    ),
                  ],
                ),
                Container(width: 35),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Time: ', style: TextStyle(fontSize: 22)),
                Container(width: 100),
                Column(
                  children: <Widget>[
                    Text(timed.format(selectedTime1) + period1),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Start At"),
                      color: hGreen,
                      onPressed: () async {
                        final selectedTime1 = await selectTime(context,
                            TimeOfDay.now().hour, TimeOfDay.now().minute);
                        if (selectedTime1 == null) return;
                        if (selectedTime1.period == DayPeriod.am) {
                          period1 = "am";
                        } else {
                          period1 = "pm";
                        }
                        setState(() {
                          if (selectedTime1.hourOfPeriod != 0) {
                            this.selectedTime1 = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                selectedTime1.hourOfPeriod,
                                selectedTime1.minute);
                          } else {
                            this.selectedTime1 = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                12,
                                selectedTime1.minute);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(timed.format(selectedTime2) + period2),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text("Finish At"),
                      color: hGreen,
                      onPressed: () async {
                        final selectedTime2 = await selectTime(
                            context, selectedTime1.hour, selectedTime1.minute);
                        if (selectedTime2 == null) return;
                        if (selectedTime2.period == DayPeriod.am) {
                          period2 = "am";
                        } else {
                          period2 = "pm";
                        }
                        setState(() {
                          if (selectedTime2.hourOfPeriod != 0) {
                            this.selectedTime2 = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                selectedTime2.hourOfPeriod,
                                selectedTime2.minute);
                          } else {
                            this.selectedTime2 = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                12,
                                selectedTime2.minute);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Container(width: 20),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Routine: ', style: TextStyle(fontSize: 22)),
                Container(width: 75),
                DropdownButton(
                  value: selectedRoutine,
                  items: dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                Container(
                  width: 30,
                )
              ],
            ),
            Container(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                child: Text('Create New Activity'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                color: hGreen,
                onPressed: () {
                  submit();
                  if (check) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    check = false;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
      );

  Future<TimeOfDay> selectTime(BuildContext context, int hour, int minutes) {
    final now = DateTime.now();
    return showTimePicker(
        context: context, initialTime: TimeOfDay(hour: hour, minute: minutes));
  }

  onChangeDropdownItem(Routines selectedRoutine2) {
    setState(() {
      selectedRoutine = selectedRoutine2;
    });
  }

  void submit() {
    if (titleKey.currentState.validate() &&
        locationKey.currentState.validate() &&
        descriptionKey.currentState.validate()) {
      titleKey.currentState.save();
      locationKey.currentState.save();
      descriptionKey.currentState.save();
      check = true;
      int expectedMinutes = selectedTime2.difference(selectedTime1).inMinutes;
      final int hour = expectedMinutes ~/ 60;
      final int minutes = expectedMinutes % 60;
      String expected =
          '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
      Task sub = new Task(
        title: title,
        location: location,
        description: description,
        date: dated.format(selectedDate),
        startTime: timed.format(selectedTime1) + period1,
        endTime: timed.format(selectedTime2) + period1,
        routine: selectedRoutine.name,
        actualStart: "TBD",
        actualEnd: "TBD",
        expected: expected,
        completed: "false",
      );
      writeToFile(title, sub);
    }
  }

  void writeToFile(String key, dynamic value) {
    if (fileExists) {
      List<dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.add(value);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  void noonCheck1(DateTime dateTime) {
    if (TimeOfDay.fromDateTime(dateTime).period == DayPeriod.am) {
      period1 = "am";
    } else {
      period1 = "pm";
    }
  }

  void noonCheck2(DateTime dateTime) {
    if (TimeOfDay.fromDateTime(dateTime).period == DayPeriod.am) {
      period2 = "am";
    } else {
      period2 = "pm";
    }
  }
}

class Routines {
  int id;
  String name;

  Routines(this.id, this.name);

  static List<Routines> getRoutines() {
    return <Routines>[
      Routines(1, 'Do Not Repeat'),
      Routines(2, 'Daily'),
      Routines(3, 'Weekly'),
      Routines(4, 'Monthly'),
    ];
  }
}
