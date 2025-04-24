import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonScreen(), //
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            debugPrint('Dont do this again!');
          },
          child: Container(
            height: 60.0,
            width: double.infinity,
            margin: const EdgeInsets.all(20.0), //
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)), //
            ),
            child: Center(
              child: Text('My Button'), //
            ),
          ),
        ),
      ), //
    );
  }
}
