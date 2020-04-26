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
  String title, location, description, date, time, routine;
  bool check = false;
  NewActivityWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(),
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
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Title: ', style: TextStyle(fontSize: 22)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      key: titleKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert title.'
                                  : null,
                              onSaved: (input) => title = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Location: ', style: TextStyle(fontSize: 22)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      key: locationKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert location.'
                                  : null,
                              onSaved: (input) => location = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 200.0,
                            height: 30.0,
                            child: TextFormField(
                              cursorColor: hGreen,
                              validator: (input) => input.length < 1
                                  ? 'Please insert description.'
                                  : null,
                              onSaved: (input) => description = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 200.0,
                            height: 30.0,
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
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 200.0,
                            height: 30.0,
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
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 200.0,
                            height: 30.0,
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
            Container(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                child: Text('New Activity'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                color: hGreen,
                onPressed: () {
                  submit();
                  if (check) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    check = false;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    if (titleKey.currentState.validate() &&
        locationKey.currentState.validate() &&
        descriptionKey.currentState.validate()) {
      titleKey.currentState.save();
      locationKey.currentState.save();
      descriptionKey.currentState.save();
      check = true;
      print(title);
    }
  }
}
