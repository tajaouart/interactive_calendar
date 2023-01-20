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

  /// The selected days that should be highlighted
  final List<DateTime> highlightedDays;

  /// Callback function to be called when a highlighted day is tapped
  final Function(DateTime)? onHighlightedDayTap;

  /// Callback function to be called when a day that is not highlighted is tapped
  final Function(DateTime)? onOtherDayTap;

  /// The text color to use for highlighted days
  final Color textHighLightColor;

  /// The current date to be displayed
  final DateTime currentDate;

  /// The background color to use for highlighted days
  final Color highLightColor;

  /// Whether the calendar is in dark mode or not
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
