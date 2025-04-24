import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: SafeArea(child: MyApp()), //
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Title'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          //
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search), //
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello World!'), //
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        //
      ),
    );
  }
}
