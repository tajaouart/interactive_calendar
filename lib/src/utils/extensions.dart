import 'package:intl/intl.dart';

extension DateTimeComparison on DateTime {
  /// Check if the current date is the same day as the provided date
  bool isSameDayAs(DateTime other) {
    final current = DateTime(
      year,
      month,
      day,
    );

    final otherDay = DateTime(
      other.year,
      other.month,
      other.day,
    );

    return current == otherDay;
  }
}

/// returns month name corresponding to the provided index
String indexToMonthName(int index) {
  List<String> monthNames = [];
  for (int i = 1; i <= 12; i++) {
    var date = DateTime(2022, i, 1);
    monthNames.add(DateFormat.MMMM().format(date));
  }
  if (index > 0 && index <= 12) {
    return monthNames[index - 1];
  } else {
    return '';
  }
}
