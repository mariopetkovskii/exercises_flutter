import 'package:flutter/material.dart';
import 'package:flutter_exercise_3/widgets/newexam.dart';

import 'models/Exam.dart';
void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Exam> exams= [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    exams.add(Exam(id: "0", subject: "WP", datetime: "24.06.2020 23:00:00"));
    exams.add(Exam(id: "1", subject: "EMT", datetime: "25.06.2020 23:00:00"));
    
    super.initState();
  }

  void deleteItem(String id){
    setState((){
      exams.removeWhere((element) => element.id == id);
    });
  }

  void _addItemFunction(BuildContext ct) {
    
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(onTap: () {}, child: NewExam(_addNewItemToList), behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(Exam item) {
    setState(() {
      exams.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title: const Text("Exercise 3 - Student exams"),
              backgroundColor: Colors.lightBlue,
              leading: IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: "Add new exam",
              onPressed: () => _addItemFunction(context),),
          ),
          body: SingleChildScrollView( 
            child: Container( 
              padding: const EdgeInsets.all(8),
              child: Column(
                children: exams.map((e){
                      return Container(
                          child: Card(
                            child:ListTile( 
                              title: Text(e.subject),
                              subtitle: Text(e.datetime),
                              trailing: ElevatedButton( 
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red
                                  ),
                                  child: Icon(Icons.delete),
                                  onPressed: (){
                                     deleteItem(e.id) ;
                                  },
                                ),
                             ),
                          ),
                      );
                  }).toList(),
                  
                ),
            ),
          ),
      );
  }
}


