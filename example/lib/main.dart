import 'package:flutter/material.dart';
import 'package:interactive_calendar/interactive_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Calendar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Interactive Calendar Demo'),
    );
  }
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
              darkMode: darkMode,
              currentDate: currentDate,
              displayMode: DisplayMode.singleMonth,
              onNextYear: nextYear(),
              onPreviousYear: previousYear(),
              highlightedDays: [
                DateTime(2023, 1, 1),
                DateTime(2023, 2, 2),
              ],
            ),
            InteractiveCalendar(
              darkMode: darkMode,
              currentDate: currentDate,
              displayMode: DisplayMode.column,
              onNextYear: nextYear(),
              onPreviousYear: previousYear(),
              highlightedDays: [
                DateTime(2023, 1, 1),
                DateTime(2023, 2, 2),
              ],
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
