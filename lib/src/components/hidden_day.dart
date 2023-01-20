import 'package:flutter/material.dart';

import 'day_widget.dart';

class HiddenDay extends StatelessWidget {
  const HiddenDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DayWidget(
      dayNumber: 0,
      isHidden: true,
      darkMode: false,
    );
  }
}
