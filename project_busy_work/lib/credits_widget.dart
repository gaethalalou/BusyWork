import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myColors.dart';

class CreditsWidget extends StatelessWidget {
  final Color color;
  CreditsWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("About Us", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            Container(
              height: 15,
            ),
            Container(
              height: 180,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(height: 15),
                  Text("Developers",
                      style: TextStyle(
                          fontSize: 24,
                          color: lGreen,
                          fontWeight: FontWeight.w500)),
                  Container(height: 10),
                  Text("Arturo Jimenez",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Container(height: 10),
                  Text("Abraham Mulualem",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Container(height: 10),
                  Text("Gaeth Alalou",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                ],
              )),
            ),
            Container(
              height: 110,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(height: 15),
                  Text("Art Assets",
                      style: TextStyle(
                          fontSize: 24,
                          color: lGreen,
                          fontWeight: FontWeight.w500)),
                  Container(height: 10),
                  Text("Undraw: Introduction Page ",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                ],
              )),
            ),
            Container(
              height: 220,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(height: 15),
                  Text("Tech",
                      style: TextStyle(
                          fontSize: 24,
                          color: lGreen,
                          fontWeight: FontWeight.w500)),
                  Container(height: 10),
                  Text("Flutter & Dart",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Container(height: 10),
                  Text("JSON",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Container(height: 10),
                  Text("Android Studio",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Container(height: 10),
                  Text("Visual Studio Code",
                      style: TextStyle(fontSize: 24, color: Colors.grey)),
                ],
              )),
            ),
          ],
        ),
      ),
      backgroundColor: color,
    );
  }
}
