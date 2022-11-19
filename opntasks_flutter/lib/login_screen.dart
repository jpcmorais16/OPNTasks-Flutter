import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'pretask_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? text;
  bool isLogging = false;
  void login(BuildContext context, String idn) async {
    var url = Uri.http('Teste-env.eba-tcxtgrep.us-east-1.elasticbeanstalk.com',
        '/api/Login', {'IDN': idn});
    isLogging = true;
    await http.post(url).then((response) async {
      var user = convert.jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PreTaskScreen(
              idn: idn, hasTaskInitially: user["taskGoal"] != null),
        ),
      );
      isLogging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 28, 146, 32),
          ),
          body: Container(
            alignment:
                Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .3),
            child: FractionallySizedBox(
              heightFactor: 0.5,
              widthFactor: 0.8,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 28, 19),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 30),
                      child: TextField(
                        onChanged: (value) => text = value,
                        onSubmitted: (value) => login(context, value),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 20)),
                          hintText: 'Escreva seu IDN',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.lerp(
                          Alignment.bottomCenter, Alignment.center, 0.4)!,
                      child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromARGB(255, 28, 146, 32),
                          onPressed: () {
                            if (text != null && !isLogging)
                              login(context, text!);
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
