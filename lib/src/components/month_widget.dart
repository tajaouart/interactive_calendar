import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:interactive_calendar/src/interactive_calendar.dart';
import 'package:interactive_calendar/src/utils/extensions.dart';

import 'day_widget.dart';
import 'hidden_day.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    required this.textHighLightColor,
    required this.highlightedDays,
    required this.highLightColor,
    required this.displayMode,
    required this.darkMode,
    this.onPreviousMonth,
    required this.month,
    required this.year,
    this.onNextMonth,
    this.onDayTap,
    Key? key,
  }) : super(key: key);

  final List<DateTime> highlightedDays;
  final Function(DateTime)? onDayTap;
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
      children: [
        if (displayMode == DisplayMode.column)
          SizedBox(
            child: Text(
              indexToMonthName(month),
              style: TextStyle(color: (darkMode ? Colors.white : Colors.black)),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: (darkMode ? Colors.white12 : Colors.black12),
              width: 2,
            ),
          ),
          child: Wrap(
            children: [
              ...List.generate(weekday > 0 ? weekday - 1 : weekday, (index) {
                return const HiddenDay();
              }),
              ...List.generate(
                days,
                (index) {
                  final highlightedDay = highlightedDays.firstWhereOrNull(
                    (element) {
                      return element.isSameDayAs(
                        DateTime(year, month, index + 1),
                      );
                    },
                  );
                  return DayWidget(
                    date: highlightedDay,
                    darkMode: darkMode,
                    onTap: onDayTap,
                    dayNumber: index + 1,
                    highlightColor: highLightColor,
                    textHighlightColor: textHighLightColor,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
