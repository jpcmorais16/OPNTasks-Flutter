import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? opnTaskProduct;
  String? opnTaskInstitution;
  String? opnTaskQuantity;
  void getTask() async {
    var url = Uri.http('Teste-env.eba-tcxtgrep.us-east-1.elasticbeanstalk.com',
        '/api/Task/CreateRandomTask', {'IDN': '5'});
    print(url);
    var response = await http.get(url);

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    opnTaskInstitution = jsonResponse["InstitutionName"];
    print(opnTaskInstitution);
    var product =
        convert.jsonDecode(jsonResponse["Product"]) as Map<String, dynamic>;

    opnTaskProduct = product["name"];
  }

  @override
  Widget build(BuildContext context) {
    getTask();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 146, 32),
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentGeometry.lerp(
                  Alignment.bottomLeft, Alignment.center, .04)!,
              child: FloatingActionButton(
                onPressed: () => null,
                backgroundColor: Colors.red,
              ),
            ),
            Align(
              alignment: AlignmentGeometry.lerp(
                  Alignment.bottomRight, Alignment.center, .04)!,
              child: FloatingActionButton(
                onPressed: () => null,
                backgroundColor: Colors.green,
              ),
            ),
            Container(
              alignment: Alignment.lerp(
                  Alignment.topCenter, Alignment.bottomCenter, .3),
              child: FractionallySizedBox(
                widthFactor: .9,
                heightFactor: .75,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 154, 28, 19),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Instituição: $opnTaskInstitution"),
                      Text("Produto: $opnTaskProduct")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
