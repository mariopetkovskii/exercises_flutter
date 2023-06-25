import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget{
  final List<Appointment> getAppointments;

  Calendar(this.getAppointments);

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar>{

  List<Appointment> allExamsAppointment = [];

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SfCalendar(
        view: CalendarView.week,
        dataSource: ExamDataSource(widget.getAppointments),
      ),
    );
  }

}

class ExamDataSource extends CalendarDataSource{
  ExamDataSource(List<Appointment> source){
    appointments = source;
  }
}