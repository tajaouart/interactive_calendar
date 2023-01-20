import 'package:flutter/material.dart';
import '../utils/extensions.dart';

/// A widget that displays a month selection with left and right arrows
/// to navigate to the previous and next months respectively.
class MonthSelection extends StatelessWidget {
  const MonthSelection({
    /// whether the app is in dark mode or not
    required this.darkMode,

    /// the current month index
    required this.currentMonth,

    /// callback when previous month button is pressed
    required this.onPreviousMonth,

    /// callback when next month button is pressed
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
          key: const Key('PreviousMonthButton'),
          onPressed: (currentMonth > 1)
              ? () {
                  onPreviousMonth.call();
                }
              : null,
          icon: Icon(
            key: const Key('PreviousMonthIcon'),
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
          key: const Key('NextMonthButton'),
          onPressed: (currentMonth < 12)
              ? () {
                  onNextMonth.call();
                }
              : null,
          icon: Icon(
            key: const Key('NextMonthIcon'),
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
