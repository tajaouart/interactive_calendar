import 'package:flutter/material.dart';

import 'month_widget.dart';
import 'week_days_widget.dart';

class InteractiveCalendar extends StatelessWidget {
  const InteractiveCalendar({
    required this.currentYear,
    this.highlightedDays = const <DateTime>[],
    this.onDayTap,
    this.highLightColor = Colors.green,
    this.textHighLightColor = Colors.white,
    this.onPreviousYear,
    this.onNextYear,
    this.darkMode = false,
    Key? key,
  }) : super(key: key);

  final int currentYear;
  final Color highLightColor;
  final Color textHighLightColor;
  final Function(DateTime)? onDayTap;
  final Function()? onPreviousYear;
  final Function()? onNextYear;
  final List<DateTime> highlightedDays;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPreviousYear,
              icon: Icon(
                Icons.chevron_left,
                color: onPreviousYear != null
                    ? (darkMode ? Colors.white : Colors.black)
                    : Colors.grey,
                size: 32,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              currentYear.toString() ?? '----',
              style: TextStyle(
                color: darkMode ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: onNextYear,
              icon: Icon(
                Icons.chevron_right,
                color: onNextYear != null
                    ? (darkMode ? Colors.white : Colors.black)
                    : Colors.grey,
                size: 32,
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: WeekDaysWidget(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(12, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 24.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: MonthWidget(
                    darkMode: darkMode,
                    month: index + 1,
                    year: currentYear,
                    highlightedDays: highlightedDays,
                    onDayTap: onDayTap,
                    highLightColor: highLightColor,
                    textHighLightColor: textHighLightColor,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
