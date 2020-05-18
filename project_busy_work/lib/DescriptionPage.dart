import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'myColors.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'tasks.dart';

class DescriptionPage extends StatefulWidget {
  final String desc;
  final String title;
  final String location;
  final String date;
  final String startTime;
  final String endTime;
  final String routine;
  final String expected;
  final String id;

  DescriptionPage(
      {Key key,
      this.desc,
      this.title,
      this.location,
      this.date,
      this.startTime,
      this.endTime,
      this.routine,
      this.expected,
      this.id})
      : super(key: key);

  @override
  _DescriptionPage createState() => _DescriptionPage();

  // String timeHeader(){
  //   DateTime start = DateTime.parse(startTime);
  //   DateTime end = DateTime.parse(endTime);
  //   return (new DateFormat.jm().format(start)).toString() + " - " + (new DateFormat.jm().format(end)).toString();
  // }
}

class _DescriptionPage extends State<DescriptionPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  List<String> get hm => widget.expected.split(":");
  int get hour => int.parse(hm[0]);
  int get minute => int.parse(hm[1]);
  Stopwatch stopwatch = new Stopwatch();
  bool isPlaying = false;
  String hours = "";
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  List<dynamic> fileContent;
  DateTime first;
  DateTime second;
  bool timeOpen;
  int timeOpenCount;

  String timerString(bool isElapsed) {
    Duration duration = controller.duration * controller.value;
    hours = duration.inHours == 0 ? "" : '${duration.inHours}:';
    String remaining = hours +
        '${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    if (!controller.isAnimating) {
      stopwatch.reset();
    }
    if (timeOpen == true && isElapsed == false) {
      if (hm[0] != "00")
        remaining = hm[0] + ":" + hm[1] + ":00";
      else
        remaining = hm[1] + ":00";
      timeOpenCount = timeOpenCount + 1;
      if (timeOpenCount == 2) timeOpen = false;
    }

    Duration elapsedDuration = stopwatch.elapsed;

    String elapsed = controller.isAnimating
        ? '${elapsedDuration.inMinutes}:${(elapsedDuration.inSeconds % 60).toString().padLeft(2, '0')}'
        : "00:00";
    return isElapsed ? elapsed : remaining;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        hours: hour,
        minutes: minute,
      ),
    );

    timeOpen = true;
    timeOpenCount = 0;

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back_ios),
                    color: hGreen,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
            Container(
              height: 335,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 12.0,
                    ),
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.startTime + " - " + widget.endTime,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Expanded(
                      child: Align(
                    alignment: FractionalOffset.center,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return new CustomPaint(
                                  painter: TimerPainter(
                                    animation: controller,
                                    color: lGreen,
                                    backgroundColor: Colors.white10,
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.center,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 45,
                                ),
                                Text(
                                  "Elapsed Time",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                AnimatedBuilder(
                                    animation: controller,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return new Text(
                                        timerString(true),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 60,
                                            fontWeight: FontWeight.w200),
                                      );
                                    }),
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  "Remaining Time",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                AnimatedBuilder(
                                    animation: controller,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return new Text(
                                        timerString(false),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Container(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Text("percentage"),

                        FloatingActionButton(
                          backgroundColor: lightGreen,
                          focusColor: Colors.white,
                          foregroundColor: Colors.white,
                          splashColor: hGreen,
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child) {
                              return Icon(controller.isAnimating
                                  ? Icons.pause
                                  : Icons.play_arrow);
                            },
                          ),
                          onPressed: () {
                            if (controller.isAnimating) {
                              controller.stop();
                              stopwatch.stop();
                              second = DateTime.now();
                              int expectedMinutes =
                                  second.difference(first).inMinutes;
                              final int hourly = expectedMinutes ~/ 60;
                              final int minutely = expectedMinutes % 60;
                              String actual =
                                  '${hourly.toString().padLeft(2, "0")}:${minutely.toString().padLeft(2, "0")}';
                              Task replace = new Task(
                                id: widget.id,
                                title: widget.title,
                                description: widget.desc,
                                location: widget.location,
                                date: widget.date,
                                startTime: widget.startTime,
                                endTime: widget.endTime,
                                routine: widget.routine,
                                expected: widget.expected,
                                actualEnd: "TBD",
                                actualStart: actual,
                                completed: "true",
                              );
                              writeToFile(widget.id, replace);
                              Navigator.pop(context);
                            } else {
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);
                              stopwatch.start();
                              first = DateTime.now();
                            }
                          },
                        ),

                        // Text("percentage")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
              child: Container(
                margin: EdgeInsets.only(left: 9.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 2.0),
                      height: 30,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description: ", //+ "\nLocation: "+widget.location,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: hGreen,
                            fontSize: 21),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.desc,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 2.0),
                      height: 30,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Location: ", //+ "\nLocation: "+widget.location,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: hGreen,
                            fontSize: 21),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.location,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void writeToFile(String key, dynamic value) {
    List<dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
    for (var i = 0; i < jsonFileContent.length; i++) {
      print(key);
      if (jsonFileContent[i]["id"] == key) jsonFileContent.removeAt(i);
    }
    jsonFileContent.add(value);
    jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
