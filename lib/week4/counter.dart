import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String message = 'Hello friends';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 0, 255),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 22, color: Colors.pink[700]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //debugPrint('test');
            if (message == 'Hello friends') {
              message = 'Hello me';
            } else {
              message = 'Hello friends';
            }
          });
        },
        backgroundColor: const Color.fromARGB(255, 255, 0, 255),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
