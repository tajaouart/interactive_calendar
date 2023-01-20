import 'package:flutter/material.dart';
import 'components/calendar_column_display.dart';
import 'components/month_selection.dart';
import 'components/calendar_single_month_display.dart';
import 'components/week_days_widget.dart';
import 'components/year_selection.dart';

class InteractiveCalendar extends StatefulWidget {
  const InteractiveCalendar({
    required this.currentDate,
    this.highlightedDays = const <DateTime>[],
    this.onHighlightedDayTap,
    this.onOtherDayTap,
    this.highLightColor = Colors.green,
    this.textHighLightColor = Colors.white,
    this.onPreviousYear,
    this.onPreviousMonth,
    this.onNextMonth,
    this.onNextYear,
    this.displayMode = DisplayMode.column,
    this.darkMode = false,
    Key? key,
  }) : super(key: key);

  final DateTime currentDate;
  final DisplayMode displayMode;
  final Color highLightColor;
  final Color textHighLightColor;
  final Function(DateTime)? onHighlightedDayTap;
  final Function(DateTime)? onOtherDayTap;
  final Function()? onPreviousYear;
  final Function()? onPreviousMonth;
  final Function()? onNextYear;
  final Function()? onNextMonth;
  final List<DateTime> highlightedDays;
  final bool darkMode;

  @override
  State<InteractiveCalendar> createState() => _InteractiveCalendarState();
}

class _InteractiveCalendarState extends State<InteractiveCalendar> {
  int currentMonth = 1;

  @override
  void initState() {
    currentMonth = widget.currentDate.month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YearSelection(
          year: widget.currentDate.year,
          darkMode: widget.darkMode,
          onNextYear: widget.onNextYear,
          onPreviousYear: widget.onPreviousYear,
        ),
        if (widget.displayMode == DisplayMode.singleMonth)
          MonthSelection(
            darkMode: widget.darkMode,
            currentMonth: currentMonth,
            onNextMonth: () {
              widget.onNextMonth?.call();
              setState(() {
                currentMonth++;
              });
            },
            onPreviousMonth: () {
              widget.onPreviousMonth?.call();
              setState(() {
                currentMonth--;
              });
            },
          ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: WeekDaysWidget(
            darkMode: widget.darkMode,
          ),
        ),
        widget.displayMode == DisplayMode.column
            ? CalendarColumnDisplay(
                currentDate: widget.currentDate,
                highlightedDays: widget.highlightedDays,
                onHighlightedDayTap: widget.onHighlightedDayTap,
                onOtherDayTap: widget.onOtherDayTap,
                highLightColor: widget.highLightColor,
                textHighLightColor: widget.textHighLightColor,
                darkMode: widget.darkMode,
              )
            : Expanded(
                child: CalendarSingleMonthDisplay(
                  currentMonth: currentMonth,
                  currentYear: widget.currentDate.year,
                  highlightedDays: widget.highlightedDays,
                  onHighlightedDayTap: widget.onHighlightedDayTap,
                  onOtherDayTap: widget.onOtherDayTap,
                  highLightColor: widget.highLightColor,
                  textHighLightColor: widget.textHighLightColor,
                  darkMode: widget.darkMode,
                ),
              ),
      ],
    );
  }
}

enum DisplayMode {
  singleMonth,
  column,
}
