import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'myColors.dart';
import 'activity_widget.dart';
import 'package:projectbusywork/newactivity_widget.dart';

class OverviewWidget extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<OverviewWidget> {
  final List<ListItem> tasks = [MessageItem('task 1', 'sleep')];
  //List<String> tasks = ['task 1', 'task 2', 'task 3'];
  final TextEditingController eCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  CalendarController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 320,
                  height: 10,
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewActivityWidget(bgGreen, "New Activity")),
                    );
                  },
                  child: new Icon(
                    Icons.add,
                    size: 35.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: hGreen,
                ),
              ],
            ),
            Container(
              height: 10,
              //child: Text("OverView",)
            ),
            TableCalendar(
              calendarController: _controller,
              initialCalendarFormat: CalendarFormat.week,
              headerVisible: false,
              rowHeight: 70,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle:
                    TextStyle(color: hGreen, fontWeight: FontWeight.bold),
              ),
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  margin: EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hGreen,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                dayBuilder: (context, date, events) => Container(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                        color: lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  margin: EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
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
                    left: 20.0, right: 20.0, top: 50, bottom: 250),
                child: new ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return ListTile(
                        title: tasks[Index].buildTitle(context),
                        subtitle: tasks[Index].buildSubtitle(context),
                      );
                    }

                    //children: tasks.map((task) => Butt(task)).toList(),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String task;
  final String description;

  MessageItem(this.task, this.description);

  Widget buildTitle(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: Text(task),
        shape: RoundedRectangleBorder(side: BorderSide(width: 100)),
        foregroundColor: lGreen,
        backgroundColor: bgWhite,
      );

  Widget buildSubtitle(BuildContext context) => Text(description);
}
