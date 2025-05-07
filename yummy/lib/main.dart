import 'package:flutter/material.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatelessWidget {
  const Yummy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy', //
      home: HomePage(title: 'Yummy'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({
    super.key, //
    required this.title, //
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title, //
        ),
      ), //
      body: Center(
        child: Text(
          'Are You Hungry? 😋', //
        ),
      ),
    );
  }
}
