import 'package:flutter/material.dart';

class YearSelection extends StatelessWidget {
  const YearSelection({
    required this.year,
    required this.darkMode,
    this.onPreviousYear,
    this.onNextYear,
    Key? key,
  }) : super(key: key);

  final int year;
  final bool darkMode;
  final Function()? onPreviousYear;
  final Function()? onNextYear;

  @override
  Widget build(BuildContext context) {
    final currentYearStr = year.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
        const SizedBox(
          width: 8,
        ),
        Text(
          currentYearStr,
          style: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
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
