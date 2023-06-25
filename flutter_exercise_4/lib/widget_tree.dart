import 'package:flutter/material.dart';
import 'package:flutter_exercise_4/pages/home_page.dart';
import 'package:flutter_exercise_4/pages/login_register_page.dart';
import 'pages/exams.dart';

import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyApp();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
