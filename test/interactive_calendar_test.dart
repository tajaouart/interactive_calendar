import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interactive_calendar/interactive_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('InteractiveCalendar displayMode = singleMonth, data display',
      (WidgetTester tester) async {
    final now = DateTime.now();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            textHighLightColor: Colors.red,
            highlightedDays: [now],
            currentDate: now,
            displayMode: DisplayMode.singleMonth,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // current year
    expect(
      find.text(now.year.toString()),
      findsOneWidget,
    );

    // current month
    expect(
      find.text(DateFormat.MMMM().format(now)),
      findsOneWidget,
    );

    // week days names
    for (int i = 0; i < 7; i++) {
      final day = DateFormat.E().format(now.add(Duration(days: i)));
      expect(
        find.text(day),
        findsOneWidget,
      );
    }

    // check all days of the month
    final targetMonth = now.month;
    final targetYear = now.year;

    for (DateTime date = DateTime(targetYear, targetMonth);
        date.month == targetMonth;
        date = date.add(const Duration(days: 1))) {
      expect(
        find.text(date.day.toString()),
        findsOneWidget,
      );
    }
  });

  testWidgets('InteractiveCalendar displayMode = column, data display',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            textHighLightColor: Colors.red,
            highlightedDays: [DateTime.now()],
            currentDate: DateTime.now(),
            displayMode: DisplayMode.column,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // check current year
    expect(
      find.text(DateTime.now().year.toString()),
      findsOneWidget,
    );

    // check all listed months names
    final now = DateTime.now();
    for (int i = 0; i < 11; i++) {
      final day = DateFormat.MMMM().format(
        DateTime(
          now.year,
          now.month + i,
        ),
      );
      expect(
        find.text(day),
        findsOneWidget,
      );
    }
    expect(
      find.text(DateFormat.MMMM().format(DateTime.now())),
      findsOneWidget,
    );

    // check week days names
    for (int i = 0; i < 7; i++) {
      final day = DateFormat.E().format(DateTime.now().add(Duration(days: i)));
      expect(
        find.text(day),
        findsOneWidget,
      );
    }

    // check all days of the month
    const targetMonth = 7;
    int targetYear = 2022;

    for (DateTime date = DateTime(targetYear, targetMonth);
        date.month == targetMonth;
        date = date.add(const Duration(days: 1))) {
      expect(
        find.text(date.day.toString()),
        findsAtLeastNWidgets(1),
      );
    }
  });

  testWidgets('InteractiveCalendar - highlightedDay colors tests',
      (WidgetTester tester) async {
    // Create a list of highlighted days.
    final first = DateTime(2022, 1, 1);
    final List<DateTime> highlightedDays = <DateTime>[
      first,
      DateTime(2022, 12, 25),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            textHighLightColor: Colors.green,
            highLightColor: Colors.yellow,
            highlightedDays: highlightedDays,
            currentDate: first,
            displayMode: DisplayMode.singleMonth,
          ),
        ),
      ),
    );

    // highlighted day (day 1) text color testing
    final textWidget = find.text('1');
    expect(tester.widget<Text>(textWidget).style?.color, Colors.green);

    // highlighted day (day 1) background color testing
    final key = Key('HighlightColor${first.day}/${first.month}');
    final container = find.byKey(key);
    expect(
      (tester.widget<Container>(container).decoration as BoxDecoration).color,
      Colors.yellow,
    );
  });

  // Test for property 'darkMode'
  testWidgets('Test darkMode property : true', (WidgetTester tester) async {
    final now = DateTime.now();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: InteractiveCalendar(
            darkMode: true,
            currentDate: now,
            highLightColor: Colors.green,
            textHighLightColor: Colors.white,
            displayMode: DisplayMode.singleMonth,
          ),
        ),
      ),
    );

    // check year text is white
    final yearWidget = find.text(now.year.toString());
    expect(
      tester.widget<Text>(yearWidget).style?.color,
      Colors.white,
    );

    // check month text is white
    final monthText = find.text(DateFormat.MMMM().format(now));
    expect(
      tester.widget<Text>(monthText).style?.color,
      Colors.white,
    );

    // check week days names are in white
    final monday = DateTime(2022, 10, 3);
    for (int i = 0; i < 5; i++) {
      final day = DateFormat.E().format(monday.add(Duration(days: i)));
      final dayText = find.text(day);

      expect(
        tester.widget<Text>(dayText).style?.color,
        Colors.white,
      );
    }

    // check weekends text color  is Colors.white70
    final saturday = DateTime(2022, 10, 8);
    final saturdayName = DateFormat.E().format(saturday);
    final saturdayText = find.text(saturdayName);
    expect(
      tester.widget<Text>(saturdayText).style?.color,
      Colors.white70,
    );

    final sunday = DateTime(2022, 10, 8);
    final sundayName = DateFormat.E().format(sunday);
    final sundayTExt = find.text(sundayName);
    expect(
      tester.widget<Text>(sundayTExt).style?.color,
      Colors.white70,
    );

    // next month arrow button is white
    const key = Key('NextMonthIcon');
    final nextMonthBtn = find.byKey(key);
    expect(
      tester.widget<Icon>(nextMonthBtn).color,
      Colors.white,
    );
  });
  testWidgets('Test darkMode property : false', (WidgetTester tester) async {
    final now = DateTime.now();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: InteractiveCalendar(
            darkMode: false,
            currentDate: now,
            highLightColor: Colors.green,
            textHighLightColor: Colors.white,
            displayMode: DisplayMode.singleMonth,
          ),
        ),
      ),
    );

    // check year text is white
    final yearWidget = find.text(now.year.toString());
    expect(
      tester.widget<Text>(yearWidget).style?.color,
      Colors.black,
    );

    // check month text is white
    final monthText = find.text(DateFormat.MMMM().format(now));
    expect(
      tester.widget<Text>(monthText).style?.color,
      Colors.black,
    );

    // check week days names are in black
    final monday = DateTime(2022, 10, 3);
    for (int i = 0; i < 5; i++) {
      final day = DateFormat.E().format(monday.add(Duration(days: i)));
      final dayText = find.text(day);

      expect(
        tester.widget<Text>(dayText).style?.color,
        Colors.black,
      );
    }

    // check weekends text color  is Colors.black45
    final saturday = DateTime(2022, 10, 8);
    final saturdayName = DateFormat.E().format(saturday);
    final saturdayText = find.text(saturdayName);
    expect(
      tester.widget<Text>(saturdayText).style?.color,
      Colors.black45,
    );

    final sunday = DateTime(2022, 10, 8);
    final sundayName = DateFormat.E().format(sunday);
    final sundayTExt = find.text(sundayName);
    expect(
      tester.widget<Text>(sundayTExt).style?.color,
      Colors.black45,
    );

    // next month arrow button is black
    const key = Key('NextMonthIcon');
    final nextMonthBtn = find.byKey(key);
    expect(
      tester.widget<Icon>(nextMonthBtn).color,
      Colors.black,
    );
  });

  testWidgets('Test onOtherDayTap', (WidgetTester tester) async {
    bool called = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            onOtherDayTap: (date) {
              called = date.day == 10;
            },
            currentDate: DateTime.now(),
          ),
        ),
      ),
    );

    // click on day 10 widget
    await tester.tap(find.text('10'));
    expect(called, isTrue);
  });

  testWidgets('Test onHighlightedDayTap', (WidgetTester tester) async {
    bool onHighlightedDayTapCalled = false;
    bool onOtherDayTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            highlightedDays: [DateTime(2023, 1, 15)],
            onHighlightedDayTap: (date) {
              onHighlightedDayTapCalled = date.day == 15;
            },
            onOtherDayTap: (date) {
              onOtherDayTapCalled = date.day == 15;
            },
            currentDate: DateTime.now(),
          ),
        ),
      ),
    );

    // click on day 15 widget
    // onHighlightedDayTap should be called and not onOtherDayTap
    await tester.tap(find.text('15'));
    expect(onHighlightedDayTapCalled, isTrue);
    expect(onOtherDayTapCalled, isFalse);
  });

  testWidgets('Test onNextMonth & onPreviousMonth',
      (WidgetTester tester) async {
    bool called = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            onNextMonth: () {
              called = true;
            },
            currentDate: DateTime.now(),
          ),
        ),
      ),
    );

    // Step 1: check first month name displayed : January
    final january = DateTime(2022, 1, 1);
    final januaryStr = DateFormat.E().format(january);
    expect(
      find.text(januaryStr),
      findsOneWidget,
    );

    // Go to next month : February
    const nextBtnKey = Key('NextMonthButton');
    await tester.tap(find.byKey(nextBtnKey));

    // Step 1: check first month name displayed : February
    final february = DateTime(2022, 2, 1);
    final februaryStr = DateFormat.E().format(february);
    expect(
      find.text(februaryStr),
      findsOneWidget,
    );

    // Go back to  January
    const previousBtnKey = Key('PreviousMonthButton');
    await tester.tap(find.byKey(previousBtnKey));

    // Check if January is displayed
    expect(
      find.text(januaryStr),
      findsOneWidget,
    );

    expect(called, isTrue);
  });
  testWidgets('Test onNextYear', (WidgetTester tester) async {
    bool onNextYearCalled = false;
    bool onPreviousYearCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InteractiveCalendar(
            onNextYear: () {
              onNextYearCalled = true;
            },
            onPreviousYear: () {
              onPreviousYearCalled = true;
            },
            currentDate: DateTime.now(),
          ),
        ),
      ),
    );

    // Tap on next year button
    const nextYearBtnKey = Key('NextYearButton');
    await tester.tap(find.byKey(nextYearBtnKey));
    expect(onNextYearCalled, isTrue);

    // Tap on previous year button
    const onPreviousYearBtnKey = Key('PreviousYearButton');
    await tester.tap(find.byKey(onPreviousYearBtnKey));
    expect(onPreviousYearCalled, isTrue);
  });
}
