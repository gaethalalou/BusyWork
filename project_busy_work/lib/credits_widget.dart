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
                  child: Text("Credits", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(96.0),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Text("Developers:", style: TextStyle(fontSize: 24)),
                  Container(padding: EdgeInsets.all(32)),
                  Text("Arturo", style: TextStyle(fontSize: 24)),
                  Container(padding: EdgeInsets.all(8)),
                  Text("Abraham", style: TextStyle(fontSize: 24)),
                  Container(padding: EdgeInsets.all(8)),
                  Text("Gaeth", style: TextStyle(fontSize: 24)),
                ],
              )),
            )
          ],
        ),
      ),
      backgroundColor: color,
    );
  }
}
