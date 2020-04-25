import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/myColors.dart';
import 'home_widget.dart';

class NewActivityWidget extends StatelessWidget {
  final Color color;
  final String text;
  final titleKey = GlobalKey<FormState>();
  final locationKey = GlobalKey<FormState>();
  final descriptionKey = GlobalKey<FormState>();
  final dateKey = GlobalKey<FormState>();
  final timeKey = GlobalKey<FormState>();
  final routineKey = GlobalKey<FormState>();
  NewActivityWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 20,
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
                  Text('Title: ', style: TextStyle(fontSize: 22)),
                  Container(width: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Form(
                        key: titleKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Location: ', style: TextStyle(fontSize: 22)),
                  Container(width: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Form(
                        key: locationKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
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
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Date: ', style: TextStyle(fontSize: 22)),
                  Container(width: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Form(
                        key: dateKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Time: ', style: TextStyle(fontSize: 22)),
                  Container(width: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Form(
                        key: timeKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Routine: ', style: TextStyle(fontSize: 22)),
                  Container(width: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Form(
                        key: routineKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 20.0,
                              child: TextFormField(
                                cursorColor: hGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
