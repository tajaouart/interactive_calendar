# Interactive Calendar

An interactive calendar package for Flutter, providing various display modes and customizable styles.

<img src="https://raw.githubusercontent.com/tajaouart/interactive_calendar/main/interactive_calendar_demo.gif" height="600"/>

## Features
- Built-in support for localization using the intl package.
- Dark mode support
- Display a single month or a full year of months
- Highlight specific days
- Provides callbacks for tapping on highlighted and non-highlighted days
- Customizable text and highlight colors


## Getting started
To use this package, add `interactive_calendar` as a dependency in your `pubspec.yaml` file.

## Usage

To start using the `InteractiveCalendar` class, you need to import the package:

```dart
import 'package:interactive_calendar/interactive_calendar.dart';
```

Then you can use it in your code like this:

```dart
InteractiveCalendar(
  highlightedDays: [DateTime.now()],
  onHighlightedDayTap: (DateTime date) {
  print("Tapped on $date");
  },
  currentDate: DateTime.now(),
  darkMode: false,
  displayMode: DisplayMode.column
),
```


Here's what the properties mean:

* `highlightedDays`: A list of `DateTime` objects representing the days that should be highlighted on the calendar.
* `onHighlightedDayTap`: A callback function that will be called when a user taps on a highlighted day.
* `currentDate`: A `DateTime` object representing the current date. The calendar will show the month and year corresponding to this date.
* `darkMode`: A boolean value indicating whether the calendar should be displayed in dark mode or not.
* `displayMode`: An enumeration value indicating the display mode of the calendar, either `DisplayMode.column` for a full year view or `DisplayMode.singleMonth` for a single month view.

You can also customize the text and background color of highlighted days by using the `textHighLightColor` and `highLightColor` properties respectively.


## Additional information

The `InteractiveCalendar` widget can be used to display a calendar with highlighted days. 
The user can tap on a highlighted day to trigger a callback function. 
Additionally, the user can tap on other days to trigger another callback function. 
The `InteractiveCalendar` also supports dark mode and different display modes.

If you have any issues or feature requests, please file them in the [issue tracker](https://github.com/tajaouart/interactive_calendar/issues).
