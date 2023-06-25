import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/exam.dart';
import 'package:intl/intl.dart';



class NewExam extends StatefulWidget{
  final Function addExam;

  NewExam(this.addExam);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewExamState();
  }
}

class NewExamState extends State<NewExam>{
  final subjectController = TextEditingController();
  final durationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  final latController = TextEditingController();
  final lonController = TextEditingController();

  late String subject;
  DateTime ? date;
  TimeOfDay ? time;
  late double lat;
  late double lon;


  void submitData(){
    if(subjectController.text.isEmpty){
      return;
    }
    final enteredSubject = subjectController.text;
    final enteredDate = date;
    final enteredTime = time;
    final enterDuration = durationController.text;
    final lat = latController.text;
    final lon = lonController.text;
    
    final newExam = Exam(id: "", subject: enteredSubject, datetime: enteredDate!, time: enteredTime!, duration: int.parse(enterDuration), latLng: LatLng(double.parse(lat), double.parse(lon)));
    widget.addExam(newExam);
    Navigator.of(context).pop();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: subjectController,
            decoration: InputDecoration(labelText: "Subject"),
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            controller: durationController,
            decoration: InputDecoration(labelText: "Duration of exam"),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            controller: dateController,
            decoration: InputDecoration(labelText: "Date"),
            onTap: () async {
              DateTime ?selectedDatetime;
              DateTime ?selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(), 
                  lastDate: DateTime(2030));
                  setState(() {
                    date = selectedDate;                 
                    dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate!).toString();
                  });
            },
          ),
          TextField(
            controller: timeController,
            decoration: InputDecoration(labelText: "Time"),
            onTap: () async {
              TimeOfDay ?selectedTime = await showTimePicker(
                context: context,
               initialTime: TimeOfDay.now());
               setState(() {
                 time = selectedTime;
                 timeController.text = selectedTime.toString();
               });
            },
          ),
          TextField(
            controller: latController,
            decoration: InputDecoration(labelText: "Latitude"),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            controller: lonController,
            decoration: InputDecoration(labelText: "Longitude"),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),          
          TextButton(onPressed: submitData, child: Text("Add exam"))
        ],
      ),
    );
  }
}