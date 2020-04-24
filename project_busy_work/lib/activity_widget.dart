import 'package:flutter/material.dart';
import 'myColors.dart';

class ActivityWidget extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityWidget> {
  final List<ListItem> tasks = [
    MessageItem('task 1', 'sleep'),
    MessageItem('task 2', 'take trash out'),
    MessageItem('task 3', 'set alarm for workout')
  ];
  //List<String> tasks = ['task 1', 'task 2', 'task 3'];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGreen,
        body: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            new Expanded(
              child: Container(
                decoration: new BoxDecoration(
                    color: bgWhite,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    )),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 100, bottom: 300),
                child: new ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return ListTile(
                        title: tasks[Index].buildTitle(context),
                      );
                    }

                    //children: tasks.map((task) => Butt(task)).toList(),
                    ),
              ),
            ),
          ]),
        ));
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String task;
  final String description;

  MessageItem(this.task, this.description);

  Widget buildTitle(BuildContext context) => Card(
        child: ListTile(
          onTap: () {},
          title: Text(task),
          subtitle: Text(description),
        ),
        // shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 100)),
        // foregroundColor: lGreen,
        // backgroundColor: bgWhite,
      );
}
