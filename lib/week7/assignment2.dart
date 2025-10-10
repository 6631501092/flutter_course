import 'package:flutter/material.dart';

class Assignment2W7 extends StatefulWidget {
  const Assignment2W7({super.key});

  @override
  State<Assignment2W7> createState() => _Assignment2W7State();
}

class _Assignment2W7State extends State<Assignment2W7> {
  bool sw = false; // switch state for Hot/Cold
  double _sugarLevel = 2; // 0=none, 1=less, 2=normal

  String sugarText(double value) {
    if (value == 0) return 'no sugar';
    if (value == 1) return 'less sugar';
    return 'normal sugar';
  }

  void toggleSwitch(bool? status) {
    setState(() {
      sw = status!;
    });
  }

  void makeOrder() {
    String type = sw ? 'Cold coffee' : 'Hot coffee';
    String sugar = sugarText(_sugarLevel);
    String message = '$type with $sugar';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          title: const Text('Your order'),
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Your order', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Hot / Cold Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Type'),
                Row(
                  children: [
                    const Text('Hot'),
                    Switch(value: sw, onChanged: toggleSwitch),
                    const Text('Cold'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Sugar Slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sugar level'),
                Expanded(
                  child: Slider(
                    value: _sugarLevel,
                    min: 0,
                    max: 2,
                    divisions: 2,
                    label: sugarText(_sugarLevel),
                    activeColor: Colors.deepPurple,
                    onChanged: (double value) {
                      setState(() {
                        _sugarLevel = value;
                      });
                    },
                  ),
                ),
                const Text('Normal'),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: makeOrder, child: const Text('ORDER')),
          ],
        ),
      ),
    );
  }
}
