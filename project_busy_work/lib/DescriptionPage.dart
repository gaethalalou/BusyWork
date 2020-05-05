import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myColors.dart';

class DescriptionPage extends StatefulWidget {
  final String desc;
  final String title;

  const DescriptionPage({Key key, this.desc, this.title}) : super(key: key);
  @override
  _DescriptionPage createState() => _DescriptionPage();
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
                      "${widget.title}",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
            Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
              child: Container(
                  margin: EdgeInsets.only(top: 9.0, left: 9.0),
                  child: Text(
                    "Description: ${widget.desc}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: lGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
