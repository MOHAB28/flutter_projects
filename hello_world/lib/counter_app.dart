import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Counter(), //
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _changeCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'), //
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterChange(changeCounter: _changeCounter),
            const SizedBox(width: 15), //
            DisplayCounter(counter: _counter), //
          ],
        ),
      ),
    );
  }
}

class CounterChange extends StatelessWidget {
  final VoidCallback changeCounter;
  const CounterChange({super.key, required this.changeCounter});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: changeCounter, child: const Text('Count'));
  }
}

class DisplayCounter extends StatelessWidget {
  final int counter;
  const DisplayCounter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $counter');
  }
}
