import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DynamicEvent extends StatefulWidget {
  static String routeName = "/date";
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  final todaysDate = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  final CalendarController _calendarController = CalendarController();

  // late Map<DateTime, List<MyEvents>> mySelectedEvents;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(color: Colors.black, width: 2.0),
            ),
            child: TableCalendar(
              // today's date
              // focusedDay: _focusedCalendarDate,
              // // earliest possible date
              // firstDay: _initialCalendarDate,
              // // latest allowed date
              // lastDay: _lastCalendarDate,
              // default view when displayed
              initialCalendarFormat: CalendarFormat.week,
              // default is Saturday & Sunday but can be set to any day.
              // instead of day, a number can be mentioned as well.
              weekendDays: const [DateTime.sunday, 6],
              // default is Sunday but can be changed according to locale
              startingDayOfWeek: StartingDayOfWeek.monday,
              // height between the day row and 1st date row, default is 16.0
              //daysOfWeekHeight: 40.0,
              // height between the date rows, default is 52.0
              rowHeight: 60.0,
              calendarController: _calendarController,
            ),
          ),
        ],
      ),
    );
  }
}
