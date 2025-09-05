import 'package:flutter/material.dart';
import 'dart:math';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _InputDemoState();
}

class _InputDemoState extends State<Assignment2> {
  //variables
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String result = "";

  //function
  void _calculate(String operation) {
    String text1 = _num1Controller.text.trim();
    String text2 = _num2Controller.text.trim();

    if (text1.isEmpty || text2.isEmpty) {
      setState(() {
        result = "Please enter both numbers";
      });
      return;
    }

    double? n1 = double.tryParse(text1);
    double? n2 = double.tryParse(text2);

    if (n1 == null || n2 == null) {
      setState(() {
        result = "Invalid number input";
      });
      return;
    }

    setState(() {
      if (operation == "sum") {
        result = "Result = ${n1 + n2}";
      } else if (operation == "power") {
        result = "Result = ${pow(n1, n2)}";
      }
    });
  }

  void _clear() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Number 1",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Number 2",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => _calculate("sum"),
                    child: const Text("Sum", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => _calculate("power"),
                    child: const Text("Power", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _clear,
                    child: const Text("Clear", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Result
            Text(
              result,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}