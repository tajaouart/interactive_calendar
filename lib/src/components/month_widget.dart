import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:interactive_calendar/src/interactive_calendar.dart';
import 'package:interactive_calendar/src/utils/extensions.dart';

import 'day_widget.dart';
import 'hidden_day.dart';

/// A widget that displays a month
class MonthWidget extends StatelessWidget {
  const MonthWidget({
    /// The color to use for the text when the widget is highlighted
    required this.textHighLightColor,

    /// The days that will be highlighted
    required this.highlightedDays,

    /// The color to use to highlight the widget
    required this.highLightColor,

    /// The display mode of the widget
    required this.displayMode,

    /// The callback to be called when the user taps a highlighted day
    this.onHighlightedDayTap,

    /// Whether the app is in dark mode or not
    required this.darkMode,

    /// The callback to be called when the user taps the left arrow button
    this.onPreviousMonth,

    /// The month to display
    required this.month,

    /// The year of the month to display
    required this.year,

    /// The callback to be called when the user taps the right arrow button
    this.onNextMonth,

    /// The callback to be called when the user taps a non-highlighted day
    this.onOtherDayTap,
    Key? key,
  }) : super(key: key);

  final Function(DateTime)? onHighlightedDayTap;
  final Function(DateTime)? onOtherDayTap;
  final List<DateTime> highlightedDays;
  final Function()? onPreviousMonth;
  final Color textHighLightColor;
  final Function()? onNextMonth;
  final DisplayMode displayMode;
  final Color highLightColor;
  final bool darkMode;
  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    int days = 0;
    for (DateTime indexDay = DateTime(year, month, 1);
        indexDay.month == month;
        indexDay = indexDay.add(const Duration(days: 1))) {
      days++;
    }
    int weekday = DateTime(year, month, 1).weekday;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (displayMode == DisplayMode.column)
          SizedBox(
            child: Text(
              indexToMonthName(month),
              style: TextStyle(color: (darkMode ? Colors.white : Colors.black)),
            ),
          ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: (darkMode ? Colors.white24 : Colors.black26),
                width: 2,
              ),
            ),
            child: Wrap(
              children: [
                // Create empty widgets for days before the first of the month
                ...List.generate(weekday > 0 ? weekday - 1 : weekday, (index) {
                  return const HiddenDay();
                }),
                // Create day widgets for each day of the month
                ...List.generate(
                  days,
                  (index) {
                    final date = highlightedDays.firstWhereOrNull(
                      (element) {
                        return element.isSameDayAs(
                          DateTime(year, month, index + 1),
                        );
                      },
                    );
                    return DayWidget(
                      onHighlightedDayTap: onHighlightedDayTap,
                      date: DateTime(year, month, index + 1),
                      textHighlightColor: textHighLightColor,
                      isHighlightedDay: date != null,
                      highlightColor: highLightColor,
                      onOtherDayTap: onOtherDayTap,
                      darkMode: darkMode,
                      dayNumber: index + 1,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
