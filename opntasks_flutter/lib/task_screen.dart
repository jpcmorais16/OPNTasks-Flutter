import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TaskScreen extends StatefulWidget {
  final String? idn;
  const TaskScreen({super.key, this.idn});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? opnTaskProduct;
  String? opnTaskInstitution;
  String? opnTaskQuantity;

  Future<String> getTask() async {
    var url = Uri.http('Teste-env.eba-tcxtgrep.us-east-1.elasticbeanstalk.com',
        '/api/Task/CreateRandomTask', {'IDN': widget.idn});
    var response = await http.get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    //getTask();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 28, 146, 32),
            title: Text(
              "${widget.idn}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 154, 28, 19), fontSize: 25.0),
            ),
          ),
          body: getBody()),
    );
  }

  Widget getBody() {
    return Container(
      child: FutureBuilder(
        future: getTask(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print(1);
            var jsonResponse1 =
                convert.jsonDecode(snapshot.data!) as Map<String, dynamic>;
            print(2);

            opnTaskInstitution = jsonResponse1["institutionName"];
            print(3);
            opnTaskQuantity = jsonResponse1["quantity"].toString();

            var product = jsonResponse1["product"] as Map<String, dynamic>;

            opnTaskProduct = product["name"];
            print(4);

            return Stack(
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
                          Text("Instituição: $opnTaskInstitution",
                              style: const TextStyle(fontSize: 15.0)),
                          Text("Produto: $opnTaskProduct",
                              style: const TextStyle(fontSize: 15.0)),
                          Text("Quantidade: $opnTaskQuantity",
                              style: const TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
