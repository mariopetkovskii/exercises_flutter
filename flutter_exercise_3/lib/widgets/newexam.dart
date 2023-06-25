import 'package:flutter/material.dart';
import 'package:flutter_exercise_3/models/Exam.dart';

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
  final dateController = TextEditingController();

  late String subject;
  late String date;

  void submitData(){
    if(subjectController.text.isEmpty){
      return;
    }
    final enteredSubject = subjectController.text;
    final enteredDate = dateController.text;

    if(enteredDate == null || enteredSubject == null){
      return ;
    }
    final newExam = Exam(id: "", subject: enteredSubject, datetime: enteredDate);
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
            controller: dateController,
            decoration: InputDecoration(labelText: "Date"),
            keyboardType: TextInputType.datetime,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(onPressed: submitData, child: Text("Add exam"))
        ],
      ),
    );
  }
}