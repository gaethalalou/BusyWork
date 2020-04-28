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
  final String task;
  final String description;
  final String expected;
  final String actualTime;
  MessageItem(this.task, this.description, this.expected, this.actualTime);

  Widget buildTitle(BuildContext context) => Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DescriptionPage()),
            );
          },
          title: Text(task),
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
