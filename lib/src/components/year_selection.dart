import 'package:flutter/material.dart';

class YearSelection extends StatelessWidget {
  const YearSelection({
    required this.year,
    required this.darkMode,
    this.onPreviousYear,
    this.onNextYear,
    Key? key,
  }) : super(key: key);

  /// The current year being displayed
  final int year;

  /// Whether or not the app is in dark mode
  final bool darkMode;

  /// Callback function for when the previous year button is tapped
  final Function()? onPreviousYear;

  /// Callback function for when the next year button is tapped
  final Function()? onNextYear;

  @override
  Widget build(BuildContext context) {
    final currentYearStr = year.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Icon button for previous year
        IconButton(
          onPressed: onPreviousYear,
          icon: Icon(
            Icons.chevron_left,
            color: onPreviousYear != null
                ? (darkMode ? Colors.white : Colors.black)
                : Colors.grey,
            size: 32,
          ),
        ),
        // Spacer between the icons and text
        const SizedBox(
          width: 8,
        ),
        // Text widget to show the current year
        Text(
          currentYearStr,
          style: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
            fontSize: 20,
          ),
        ),
        // Spacer between the text and the next year icon
        const SizedBox(
          width: 8,
        ),
        // Icon button for next year
        IconButton(
          onPressed: onNextYear,
          icon: Icon(
            Icons.chevron_right,
            color: onNextYear != null
                ? (darkMode ? Colors.white : Colors.black)
                : Colors.grey,
            size: 32,
          ),
        )
      ],
    );
  }
}
