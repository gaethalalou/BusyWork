import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'myColors.dart';
import 'package:projectbusywork/newactivity_widget.dart';

class OverviewWidget extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<OverviewWidget> {
  final List<ListItem> tasks = [
    MessageItem('Task 1', 'sleep', "8 hours", ""),
    MessageItem('Task2', 'Eat', "10 mins", "20 mins")
  ];
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Today's Tasks",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewActivityWidget()),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.only(
                    left: 13.0, right: 13.0, top: 5, bottom: 20),
                child: new ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return ListTile(
                        title: tasks[Index].buildTitle(context),
                      );
                    }),
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

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPage createState() => _DescriptionPage();
}

class _DescriptionPage extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: 50,
                width: 50,
                child: IconButton(
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
            ),
            Container(
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.only(
                  left: 13.0, right: 13.0, top: 5, bottom: 10),
              child: Container(
                child: TextField(
                  style: TextStyle(height: 3),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'enter decription',
                      labelText: 'description'),
                  enabled: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
