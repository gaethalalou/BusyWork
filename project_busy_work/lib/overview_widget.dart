import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  final Color color;
  final String text;
  OverviewWidget(this.color, this.text);

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
