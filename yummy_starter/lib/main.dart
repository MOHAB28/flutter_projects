import 'package:flutter/material.dart';

void main(List<String> args) {}

class Yummy extends StatelessWidget {
  const Yummy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yummy')),
      body: Center(child: Text('Hello Yummy')),
    );
  }
}
