import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class MonthSelection extends StatelessWidget {
  const MonthSelection({
    required this.darkMode,
    required this.currentMonth,
    required this.onPreviousMonth,
    required this.onNextMonth,
    Key? key,
  }) : super(key: key);

  final bool darkMode;
  final int currentMonth;
  final Function() onPreviousMonth;
  final Function() onNextMonth;

  @override
  Widget build(BuildContext context) {
    final currentMonthStr = indexToMonthName(currentMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (currentMonth > 1)
              ? () {
                  onPreviousMonth.call();
                }
              : null,
          icon: Icon(
            Icons.chevron_left,
            color: (currentMonth > 1)
                ? (darkMode ? Colors.white : Colors.black)
                : Colors.grey,
            size: 32,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          child: Text(
            currentMonthStr,
            style: TextStyle(color: (darkMode ? Colors.white : Colors.black)),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: (currentMonth < 12)
              ? () {
                  onNextMonth.call();
                }
              : null,
          icon: Icon(
            Icons.chevron_right,
            color: (currentMonth < 12)
                ? (darkMode ? Colors.white : Colors.black)
                : Colors.grey,
            size: 32,
          ),
        )
      ],
    );
  }
}
