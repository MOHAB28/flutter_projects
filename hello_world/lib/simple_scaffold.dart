import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(child: MySacffold()), //
    ),
  );
}

class MySacffold extends StatelessWidget {
  const MySacffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
          MyAppBar(title: 'App Bar'), //
          Expanded(
            child: Center(
              child: Text('Hello World'), //
            ),
          ),
        ],
      ), //
    );
  }
}

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue), //
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu), //
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
              //
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            //
          ),
        ],
      ),
    );
  }
}
