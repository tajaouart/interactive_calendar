import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    required this.day,
    Key? key,
    this.dayTime,
    this.hide = false,
    this.onDayTap,
    this.highLightColor = Colors.green,
    this.textHighLightColor = Colors.white,
  }) : super(key: key);
  final int day;
  final DateTime? dayTime;
  final bool hide;
  final Color highLightColor;
  final Color textHighLightColor;
  final Function(DateTime)? onDayTap;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery
        .of(context)
        .size
        .width - 40);
    return Opacity(
      opacity: hide ? 0 : 1,
      child: InkWell(
        onTap: (hide || onDayTap == null || dayTime == null)
            ? null
            : () {
          onDayTap?.call(dayTime!);
        },
        child: SizedBox(
          width: width / 7,
          height: width / 7,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: dayTime == null ? null : highLightColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                child: Text(
                  day.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: dayTime == null ? Colors.grey : textHighLightColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
