import 'package:flutter/material.dart';

class Assignment2W5 extends StatefulWidget {
  const Assignment2W5({super.key});

  @override
  State<Assignment2W5> createState() => _SummationAppState();
}

class _SummationAppState extends State<Assignment2W5> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

  void calculateSum() {
    String n1 = num1Controller.text.trim();
    String n2 = num2Controller.text.trim();

    if (n1.isEmpty || n2.isEmpty) {
      setState(() {
        result = "Please enter both numbers!";
      });
      return;
    }

    int? a = int.tryParse(n1);
    int? b = int.tryParse(n2);

    if (a == null || b == null) {
      setState(() {
        result = "Inputs must be valid numbers!";
      });
      return;
    }

    setState(() {
      result = "Result = ${a + b}";
    });
  }

  void clearAll() {
    num1Controller.clear();
    num2Controller.clear();
    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center vertically
          children: [
            // Input fields row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "First number",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("+", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Second number",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: calculateSum,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: clearAll,
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Result text
            Text(
              result,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}