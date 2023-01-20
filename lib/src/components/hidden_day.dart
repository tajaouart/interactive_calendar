import 'package:flutter/material.dart';
import 'day_widget.dart';

/// A widget that displays a hidden day.
/// It uses the DayWidget and sets the properties isHidden and dayNumber to 0.
class HiddenDay extends StatelessWidget {
  const HiddenDay({
    Key? key,
    this.darkMode = false,
    this.isHighlightedDay = false
  }) : super(key: key);

  /// whether the app is in dark mode or not
  final bool darkMode;

  /// whether the day is highlighted or not
  final bool isHighlightedDay;

  @override
  Widget build(BuildContext context) {
    return DayWidget(
      dayNumber: 0,
      isHidden: true,
      darkMode: darkMode,
      isHighlightedDay: isHighlightedDay,
    );
  }
}
