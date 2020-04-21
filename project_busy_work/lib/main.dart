import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'intro.dart';

void main() { 
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(App());
}

class App extends StatelessWidget {
 @override
 
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Busy Work',
     theme: ThemeData.dark(),
     home: IntroScreen(),
   );
 }
}