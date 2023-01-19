import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);
    List<String> shortDayNames = [];

    for (int i = 1; i <= 7; i++) {
      var date = DateTime(2022, 10, i);
      shortDayNames.add(DateFormat.E().format(date));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(shortDayNames.length, (index) {
        if (index < 6) {
          return Text(
            shortDayNames[index],
            style: style,
          );
        }
        return Text(
          shortDayNames[index],
          style: style.copyWith(color: Colors.white70),
        );
      }),
    );
  }
}
