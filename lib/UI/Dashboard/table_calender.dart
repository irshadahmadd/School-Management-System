import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCollender extends StatefulWidget {
  const TableCollender({Key? key}) : super(key: key);

  @override
  State<TableCollender> createState() => _TableCollenderState();
}

class _TableCollenderState extends State<TableCollender> {
  DateTime today = DateTime.now();
  void _onDaySelelcted(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Constants.kPadding / 2,
          top: Constants.kPadding,
          left: Constants.kPadding / 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Constants.purpleLight,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              today.toString().split(" ")[0],
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            TableCalendar(
              locale: "en_US",
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.white, fontSize: 12),
                cellMargin: EdgeInsets.all(0),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: false,
                titleTextStyle: TextStyle(color: Colors.white),
                formatButtonDecoration: BoxDecoration(color: Colors.white),
              ),
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(1990, 1, 1),
              lastDay: DateTime.utc(2030, 12, 30),
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              onDaySelected: _onDaySelelcted,
            ),
          ],
        ),
      ),
    );
  }
}
