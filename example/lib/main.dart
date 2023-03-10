import 'package:flutter/material.dart';
import 'package:interactive_calendar/interactive_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Interactive Calendar Demo',
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;
  final controller = PageController();
  var currentDate = DateTime.now();
  final highlightedDays = [
    DateTime(2023, 1, 1),
    DateTime(2023, 1, 7),
    DateTime(2023, 1, 15),
    DateTime(2023, 1, 18),
    DateTime(2023, 2, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: darkMode ? Colors.black : null,
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Single Month display',
              ),
              Tab(
                text: 'Column display',
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  darkMode = !darkMode;
                });
              },
              icon: Icon(
                darkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            InteractiveCalendar(
              displayMode: DisplayMode.singleMonth,
              onPreviousYear: previousYear(),
              onHighlightedDayTap: onDayTap,
              onOtherDayTap: onDayTap,
              currentDate: currentDate,
              onNextYear: nextYear(),
              darkMode: darkMode,
              highlightedDays: highlightedDays,
            ),
            InteractiveCalendar(
              displayMode: DisplayMode.column,
              onPreviousYear: previousYear(),
              onHighlightedDayTap: onDayTap,
              currentDate: currentDate,
              onNextYear: nextYear(),
              darkMode: darkMode,
              highlightedDays: highlightedDays,
            ),
          ],
        ),
      ),
    );
  }

  Function()? nextYear() {
    return currentDate.year < 2030
        ? () {
            setState(() {
              currentDate = yearAfter(currentDate);
            });
          }
        : null;
  }

  Function()? previousYear() {
    return currentDate.year > 2020
        ? () {
            setState(() {
              currentDate = yearBefore(currentDate);
            });
          }
        : null;
  }

  void onDayTap(dateTime) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final date = DateFormat.yMMMMd().format(dateTime);

        return AlertDialog(
          title: const Text('On Tap'),
          content: Text(date),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

DateTime yearAfter(DateTime date) {
  return DateTime(
    date.year + 1,
    date.month,
    date.day,
  );
}

DateTime yearBefore(DateTime date) {
  return DateTime(
    date.year - 1,
    date.month,
    date.day,
  );
}
