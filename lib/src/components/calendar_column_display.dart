import 'package:flutter/material.dart';
import 'package:interactive_calendar/interactive_calendar.dart';

import 'month_widget.dart';

class CalendarColumnDisplay extends StatelessWidget {
  const CalendarColumnDisplay({
    this.highlightedDays = const <DateTime>[],
    this.textHighLightColor = Colors.white,
    this.highLightColor = Colors.green,
    required this.currentDate,
    this.darkMode = false,
    this.onHighlightedDayTap,
    this.onOtherDayTap,
    Key? key,
  }) : super(key: key);

  final List<DateTime> highlightedDays;
  final Function(DateTime)? onHighlightedDayTap;
  final Function(DateTime)? onOtherDayTap;
  final Color textHighLightColor;
  final DateTime currentDate;
  final Color highLightColor;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                textHighLightColor: textHighLightColor,
                highlightedDays: highlightedDays,
                highLightColor: highLightColor,
                year: currentDate.year,
                darkMode: darkMode,
                onHighlightedDayTap: onHighlightedDayTap,
                onOtherDayTap: onOtherDayTap,
                month: index + 1,
                displayMode: DisplayMode.column,
              ),
            );
          }),
        ),
      ),
    );
  }
}
