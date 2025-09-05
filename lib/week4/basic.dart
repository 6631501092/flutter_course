import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My app", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 0, 255),
      ),
      body: Center(
        child: Text(
          "Hello world",
          style: TextStyle(fontSize: 22, color: Colors.pink[700]),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Color.fromARGB(255, 255, 0, 255),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
