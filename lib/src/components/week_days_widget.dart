import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({Key? key, required this.darkMode}) : super(key: key);

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: darkMode? Colors.white : Colors.black);
    List<String> shortDayNames = [];

    // Start with Monday
    var date = DateTime(2022, 10, 3);
    for (int i = 0; i < 7; i++) {
      shortDayNames.add(DateFormat.E().format(date));
      date = date.add(const Duration(days: 1));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(shortDayNames.length, (index) {
        if (index < 5) {
          return Text(
            shortDayNames[index],
            style: style,
          );
        }
        return Text(
          shortDayNames[index],
          style: style.copyWith(
            color: darkMode ? Colors.white70 : Colors.black45,
          ),
        );
      }),
    );
  }
}
