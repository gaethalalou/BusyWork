import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'myColors.dart';

class DescriptionPage extends StatefulWidget {
  final String desc;
  final String title;
  final String location;
  final String startTime;
  final String endTime;
  const DescriptionPage({Key key, this.desc, this.title, this.location, this.startTime, this.endTime}) : super(key: key);

  @override
  _DescriptionPage createState() => _DescriptionPage();
  
  String timeHeader(){
    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);
    return (new DateFormat.jm().format(start)).toString() + " - " + (new DateFormat.jm().format(end)).toString();
  }
}

class _DescriptionPage extends State<DescriptionPage> {
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
