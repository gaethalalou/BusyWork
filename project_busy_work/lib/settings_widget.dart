import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myColors.dart';
import 'credits_widget.dart';

class SettingsWidget extends StatelessWidget {
  final Color color;
  final String text;
  SettingsWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*RaisedButton(
              child: Text('Import'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Export'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {},
            ),
             */
            RaisedButton(
              child: Text('Credits'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: hGreen,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditsWidget(bgGreen)));
              },
            ),
          ],
        ),
      ),
      backgroundColor: color,
    );
  }
}
