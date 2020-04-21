import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final Color color;
  final String text;
  SettingsWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text)
      ),
      backgroundColor: color,
    );
  }
}
