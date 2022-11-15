import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 20)),
                    hintText: 'Escreva seu IDN',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
