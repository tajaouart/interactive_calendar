import 'package:flutter/material.dart';

/// A widget that displays a day with an optional highlight color.
/// It also supports tap events and hiding functionality.
class DayWidget extends StatelessWidget {
  const DayWidget({
    required this.dayNumber,
    Key? key,
    this.date,
    this.isHidden = false,
    this.onTap,
    required this.darkMode,
    this.highlightColor = Colors.green,
    this.textHighlightColor = Colors.white,
  }) : super(key: key);

  /// The number of the day to display
  final int dayNumber;

  /// The date associated with this day
  final DateTime? date;

  /// Whether or not the widget is hidden
  final bool isHidden;

  /// The color to use to highlight the widget
  final Color highlightColor;

  /// The color to use for the text when the widget is highlighted
  final Color textHighlightColor;

  final bool darkMode;

  /// The callback to be called when the user taps the widget
  final void Function(DateTime)? onTap;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 40);
    return Opacity(
      opacity: isHidden ? 0 : 1,
      child: InkWell(
        onTap: (isHidden || onTap == null || date == null)
            ? null
            : () {
                onTap?.call(date!);
              },
        child: SizedBox(
          width: width / 7,
          height: width / 7,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: date == null ? null : highlightColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                child: Text(
                  dayNumber.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: date == null ? Colors.grey : textHighlightColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
