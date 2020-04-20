import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'myColors.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _HomeState();
    }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(bgGreen, "Overview"),
    PlaceholderWidget(bgGreen, "Progress"),
    PlaceholderWidget(bgGreen, "Settings")
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Busy Work'),
      // ),  commented to remove the app bar
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0, //to remove the border from the navigation bar
        backgroundColor: Colors.white,
        selectedItemColor: lGreen,//light green
        unselectedItemColor: lGrey,//grey
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Overview'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.assessment),
            title: new Text('Progress'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          )
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