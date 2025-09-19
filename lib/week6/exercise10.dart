import 'dart:async';
import 'package:flutter/material.dart';

class Exercise10w6 extends StatefulWidget {
  const Exercise10w6({super.key});

  @override
  State<Exercise10w6> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<Exercise10w6> {
  double _timeLeft = 1.0; // starts 1.00
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel(); // cancel any running
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft -= 0.01;
          if (_timeLeft < 0) _timeLeft = 0; // no negative
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _timeLeft = 1.0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Display
            Text(
              _timeLeft.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 16),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  onPressed: _startTimer,
                  icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                  label: const Text("Start",
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text("Reset",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
