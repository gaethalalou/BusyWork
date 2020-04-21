import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final Color color;
  final String text;
  ProgressWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(text)),
      backgroundColor: color,
    );
  }
}
