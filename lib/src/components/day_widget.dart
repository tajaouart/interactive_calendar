import 'package:flutter/material.dart';

/// A widget that displays a day with an optional highlight color.
/// It also supports tap events and hiding functionality.
class DayWidget extends StatelessWidget {
  const DayWidget({
    this.textHighlightColor = Colors.white,
    this.highlightColor = Colors.green,
    required this.isHighlightedDay,
    this.onHighlightedDayTap,
    required this.dayNumber,
    required this.darkMode,
    this.isHidden = false,
    this.onOtherDayTap,
    Key? key,
    this.date,
  }) : super(key: key);

  /// The number of the day to display
  final int dayNumber;

  /// The date associated with this day
  final DateTime? date;

  final bool isHighlightedDay;

  /// Whether or not the widget is hidden
  final bool isHidden;

  /// The color to use to highlight the widget
  final Color highlightColor;

  /// The color to use for the text when the widget is highlighted
  final Color textHighlightColor;

  final bool darkMode;

  /// The callback to be called when the user taps the widget
  final void Function(DateTime)? onHighlightedDayTap;

  final void Function(DateTime)? onOtherDayTap;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 40);
    return Opacity(
      opacity: isHidden ? 0 : 1,
      child: InkWell(
        onTap: onTap(),
        child: SizedBox(
          width: width / 7,
          height: width / 7,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: isHighlightedDay ? highlightColor : null,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                child: Text(
                  dayNumber.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isHighlightedDay
                        ? textHighlightColor
                        : onOtherDayTap == null
                            ? Colors.grey
                            : darkMode
                                ? Colors.white
                                : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Function()? onTap() {
    if (isHidden || date == null) {
      return null;
    } else {
      if (onHighlightedDayTap != null && isHighlightedDay) {
        return () {
          onHighlightedDayTap?.call(date!);
        };
      } else {
        if (onOtherDayTap != null) {
          return () {
            onOtherDayTap?.call(date!);
          };
        }
      }
    }
    return null;
  }
}
