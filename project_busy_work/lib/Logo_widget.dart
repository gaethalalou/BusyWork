import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Color color;
  LogoWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Insert Logo Here", style: TextStyle(fontSize: 16))),
      backgroundColor: color,
    );
  }
}
