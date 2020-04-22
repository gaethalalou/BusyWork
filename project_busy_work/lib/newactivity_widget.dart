import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';

class NewActivityWidget extends StatelessWidget {
  final Color color;
  final String text;
  NewActivityWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('New Activity'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      backgroundColor: color,
    );
  }
}
