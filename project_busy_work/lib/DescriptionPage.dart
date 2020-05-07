import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'myColors.dart';
import 'dart:math' as math;

class DescriptionPage extends StatefulWidget {
  final String desc;
  final String title;
  final String location;
  final String startTime;
  final String endTime;
  const DescriptionPage({Key key, this.desc, this.title, this.location, this.startTime, this.endTime}) : super(key: key);

  @override
  _DescriptionPage createState() => _DescriptionPage();
  
  // String timeHeader(){
  //   DateTime start = DateTime.parse(startTime);
  //   DateTime end = DateTime.parse(endTime);
  //   return (new DateFormat.jm().format(start)).toString() + " - " + (new DateFormat.jm().format(end)).toString();
  // }
}

class _DescriptionPage extends State<DescriptionPage> with TickerProviderStateMixin{
  AnimationController controller;

  bool isPlaying = false;
  String hours ="";
  String get timerString {
    Duration duration = controller.duration * controller.value;
    hours = duration.inHours ==0 ? "" : '${duration.inMinutes}:' ; 
    return hours+'${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15, minutes: 4, ),
    );
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
                    )
                ),
              ],
            ),
            Container(
              height: 360,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
              child: Column(
                children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 12.0,),
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.startTime+" - "+widget.endTime,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
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
                                  builder: (BuildContext context, Widget child){
                                    return new CustomPaint(
                                      painter: TimerPainter(
                                        animation: controller,
                                        color: hGreen,
                                        backgroundColor: Colors.black45,
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
                                    Container(height: 45,),
                                    Text(
                                      "Elapsed Time", 
                                      style: TextStyle(
                                        color: lGreen, 
                                        fontSize: 15, 
                                        fontWeight: FontWeight.w600),
                                    ),
                                    AnimatedBuilder(
                                      animation: controller, 
                                      builder: (BuildContext context, Widget child){
                                        return new Text(
                                          timerString,
                                          style: TextStyle(color: lGreen, fontSize: 70, fontWeight: FontWeight.w200),
                                        );
                                      }
                                    ),
                                    Container(height: 10,),
                                    Text(
                                      "Remaining Time", 
                                      style: TextStyle(
                                        color: lGreen, 
                                        fontSize: 10, 
                                        fontWeight: FontWeight.w600),
                                    ),
                                    AnimatedBuilder(
                                      animation: controller, 
                                      builder: (BuildContext context, Widget child){
                                        return new Text(
                                          timerString,
                                          style: TextStyle(color: lGreen, fontSize: 30, fontWeight: FontWeight.w300),
                                        );
                                      }
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                    Container(height: 20,),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: lightGreen,
                            focusColor: Colors.white,
                            foregroundColor: Colors.white,
                            splashColor: hGreen,
                            child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child){
                                return  Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
                              },
                            ),
                            onPressed: (){
                              if(controller.isAnimating)
                                controller.stop();
                              else{
                                controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
                              }
                            },
                          )
                        ],
                      ),
                    )
                ],                
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
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
                          "Description: \n", //+ "\nLocation: "+widget.location,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: lGreen,
                            fontSize: 21),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.desc,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 2.0),
                        height: 30,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Location: \n", //+ "\nLocation: "+widget.location,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: lGreen,
                            fontSize: 21),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.location,
                          style: TextStyle(
                            color: Colors.black54,
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