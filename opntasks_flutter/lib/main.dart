import 'package:flutter/material.dart';
import 'package:opntasks_flutter/login_screen.dart';
import 'package:opntasks_flutter/pretask_screen.dart';
import 'task_screen.dart';

void main() {
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
