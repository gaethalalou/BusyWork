import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/myColors.dart';
import 'home_widget.dart';

class NewActivityWidget extends StatelessWidget {
  final Color color;
  final String text;
  NewActivityWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text('Back'),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0)),
                    color: hGreen,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Title: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Location: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Description: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Date: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Time: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Routine: ', style: TextStyle(fontSize: 24)),
                  Container(width: 20),
                  Container(
                      color: Colors.white,
                      child: Text('insert here',
                          style: TextStyle(fontSize: 20, color: Colors.black)))
                ],
              ),
              Center(
                child: RaisedButton(
                  child: Text('New Activity'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0)),
                  color: hGreen,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: color,
    );
  }
}
