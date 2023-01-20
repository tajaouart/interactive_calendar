import 'package:flutter/material.dart';
import 'package:interactive_calendar/interactive_calendar.dart';
import 'month_widget.dart';

/// A stateless widget that displays the calendar in a single month view.
class CalendarSingleMonthDisplay extends StatelessWidget {
  const CalendarSingleMonthDisplay({
    Key? key,
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
  }) : super(key: key);

  /// The currently selected year.
  final int currentYear;

  /// The color to use for highlighting days.
  final Color highLightColor;

  /// The text color to use for highlighting days.
  final Color textHighLightColor;

  /// Callback when the next month button is pressed.
  final Function()? onNextMonth;

  /// Callback when the previous month button is pressed.
  final Function()? onPreviousMonth;

  /// Callback when a highlighted day is tapped.
  final Function(DateTime)? onHighlightedDayTap;

  /// Callback when a day that is not highlighted is tapped.
  final Function(DateTime)? onOtherDayTap;

  /// A list of dates to highlight on the calendar.
  final List<DateTime> highlightedDays;

  /// Whether dark mode is enabled.
  final bool darkMode;

  /// The currently selected month.
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
