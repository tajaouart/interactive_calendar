import 'package:flutter/material.dart';
import 'package:interactive_calendar/interactive_calendar.dart';

import 'month_widget.dart';

class CalendarSingleMonthDisplay extends StatelessWidget {
  const CalendarSingleMonthDisplay({
    required this.currentYear,
    this.highlightedDays = const <DateTime>[],
    this.onHighlightedDayTap,
    this.onOtherDayTap,
    this.highLightColor = Colors.green,
    this.textHighLightColor = Colors.white,
    this.onNextMonth,
    this.onPreviousMonth,
    this.darkMode = false,
    required this.currentMonth,
    Key? key,
  }) : super(key: key);

  final int currentYear;
  final Color highLightColor;
  final Color textHighLightColor;
  final Function()? onNextMonth;
  final Function()? onPreviousMonth;
  final Function(DateTime)? onHighlightedDayTap;
  final Function(DateTime)? onOtherDayTap;
  final List<DateTime> highlightedDays;
  final bool darkMode;
  final int currentMonth;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return PageView(
      controller: controller,
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
            displayMode: DisplayMode.singleMonth,
            highlightedDays: highlightedDays,
            highLightColor: highLightColor,
            month: currentMonth,
            darkMode: darkMode,
            year: currentYear,
            onHighlightedDayTap: onHighlightedDayTap,
            onOtherDayTap: onOtherDayTap,
          ),
        );
      }),
    );
  }
}
