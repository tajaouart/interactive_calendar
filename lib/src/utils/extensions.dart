import 'package:intl/intl.dart';

extension DateTimeComparison on DateTime {
  /// Check if the current date is the same as today
  bool isToday() {
    final current = DateTime(
      year,
      month,
      day,
    );

    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    return current == today;
  }

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

  /// Check if the current date is the same month as the provided date
  bool isSameMonthAs(DateTime other) {
    final current = DateTime(
      year,
      month,
    );

    final otherDay = DateTime(
      other.year,
      other.month,
    );

    return current == otherDay;
  }

  /// Check if the current date is the same year as the provided date
  bool isSameYearAs(DateTime other) {
    final current = DateTime(
      year,
    );

    final otherDay = DateTime(
      other.year,
    );

    return current == otherDay;
  }

  /// Check if the current date is after the provided date and it's not the same day
  bool isAfterOtherDay(DateTime other) {
    return isAfter(other) && day != other.day;
  }

  /// Check if the current date is before the provided date and it's not the same day
  bool isBeforeOtherDay(DateTime other) {
    return isBefore(other) && day != other.day;
  }
}

extension StringCapitalizer on String {
  /// Capitalize the first letter of the string and make the rest of the letters lowercase
  String capitalize() {
    if (length <= 2) {
      return toUpperCase();
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
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
