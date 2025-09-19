import 'dart:async';
import 'package:flutter/material.dart';

class Assignment2W6 extends StatefulWidget {
  const Assignment2W6({super.key});

  @override
  State<Assignment2W6> createState() => _ClickGamePageState();
}

class _ClickGamePageState extends State<Assignment2W6> {
  double timeLeft = 1.0; // start time
  int clickCount = 0;
  Timer? timer;
  bool gameStarted = false; 

  void startGame() {
    setState(() {
      timeLeft = 1.0;
      clickCount = 0;
      gameStarted = true; // clicking
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        timeLeft -= 0.01;
        if (timeLeft <= 0) {
          timeLeft = 0;
          gameStarted = false; // disable clicking when time up
          timer?.cancel();
        }
      });
    });
  }

  void addClick() {
    if (gameStarted && timeLeft > 0) {
      setState(() {
        clickCount++;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Timer
            Text(
              timeLeft.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 12),

            // Click count
            Text(
              "Click = $clickCount",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: addClick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.touch_app),
                  label: const Text("Click"),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: startGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade50,
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text("PLAY"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
