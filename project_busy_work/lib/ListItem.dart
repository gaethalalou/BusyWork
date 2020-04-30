import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DescriptionPage.dart';
import 'myColors.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String title;
  final String subTitle;
  final String location;
  final String description;
  // final String startAt;
  // final String expectedEnds;
  // final String actualEnds; will use these later for new activity creation 
  final String expected;
  final String actualTime;

  MessageItem(this.title, this.subTitle, this.location, this.description,this.expected, this.actualTime);

  MessageItem.fromJson(Map<String, dynamic> json): 
        title = json['title'],
        subTitle = json['subTitle'],
        location = json['location'],
        description = json['description'],
        expected = json['expected'],
        actualTime = json['actualTime'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'subTitle': subTitle,
        'location': location,
        'description': description,
        'expected': expected,
        'actualTime': actualTime
      };

  Widget buildTitle(BuildContext context) => Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DescriptionPage()),
            );
          },
          title: Text(title),
          subtitle: Text(description +
              " • Expected: " +
              expected +
              (actualTime != "" ? " • Actual: " + actualTime : "")),
        ),
        color: lGreen,
        margin: EdgeInsets.only(top: 5.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        // shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 100)),
        // foregroundColor: lGreen,
        // backgroundColor: bgWhite,
      );
}
