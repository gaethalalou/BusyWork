import 'dart:io';
import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectbusywork/progress_widget.dart';
import 'package:projectbusywork/settings_widget.dart';
import 'overview_widget.dart';
import 'myColors.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OverviewWidget(),
    ProgressWidget(bgGreen, "Progress"),
    SettingsWidget(bgGreen, "Settings"),
    //ActivityWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Busy Work'),
      // ),  commented to remove the app bar
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgGreen,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 50,
        onTap: onTabTapped,
        index: _currentIndex,
        animationDuration: Duration(milliseconds: 350),
        items: <Widget>[
          Icon(
            Icons.home,
            color: lGreen,
            size: 25,
          ),
          Icon(
            Icons.assessment,
            color: lGreen,
            size: 25,
          ),
          Icon(
            Icons.settings,
            color: lGreen,
            size: 25,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
