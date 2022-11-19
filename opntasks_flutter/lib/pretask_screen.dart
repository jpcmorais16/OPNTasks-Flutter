import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opn_flutter/task_screen.dart';

class PreTaskScreen extends StatefulWidget {
  final bool? hasTaskInitially;
  final String? idn;
  const PreTaskScreen(
      {super.key, required this.hasTaskInitially, required this.idn});

  @override
  State<PreTaskScreen> createState() =>
      _PreTaskScreenState(hasTask: this.hasTaskInitially);
}

class _PreTaskScreenState extends State<PreTaskScreen> {
  bool? hasTask;
  _PreTaskScreenState({required this.hasTask});
  @override
  Widget build(BuildContext context) {
    if (widget.hasTaskInitially!) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TaskScreen(idn: widget.idn),
        ),
      );

      hasTask = false;
    }
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 28, 146, 32),
            ),
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.lerp(
                      Alignment.center, Alignment.topCenter, .5)!,
                  child: const Text(
                    "Vamos criar uma task?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.lerp(
                      Alignment.bottomCenter, Alignment.center, .05)!,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TaskScreen(idn: widget.idn),
                        ),
                      );

                      hasTask = false;
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
