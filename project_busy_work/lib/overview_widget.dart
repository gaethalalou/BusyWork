import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myColors.dart';
import 'package:projectbusywork/newactivity_widget.dart';

class OverviewWidget extends StatelessWidget {
  final Color color;
  final String text;
  OverviewWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  //color: Colors.white,
                  width: 320,
                  height: 10,
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewActivityWidget(bgGreen, "New Activity")),
                    );
                  },
                  child: new Icon(
                    Icons.add,
                    size: 35.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: hGreen,
                ),
              ],
            ),
            Center(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
