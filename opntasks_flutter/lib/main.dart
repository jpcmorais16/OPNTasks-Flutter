import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opn_flutter/firebase_options.dart';

import 'login_screen.dart';
import 'task_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return TaskScreen(idn: "23");
    return LoginScreen();
    //return PreTaskScreen(idn: "12");
  }
}
