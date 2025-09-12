import 'dart:math';
import 'package:flutter/material.dart';

class Assignment3W5 extends StatefulWidget {
  const Assignment3W5({super.key});

  @override
  State<Assignment3W5> createState() => _GuessGameState();
}

class _GuessGameState extends State<Assignment3W5> {
  final TextEditingController guessController = TextEditingController();

  int answer = Random().nextInt(10);
  int chances = 3;
  String message = "";
  bool gameOver = false;

  void checkGuess() {
    if (gameOver) {
      resetGame();
      return;
    }

    String input = guessController.text.trim();
    if (input.isEmpty) {
      setState(() {
        message = "Please enter a number!";
      });
      return;
    }

    int? guess = int.tryParse(input);
    if (guess == null || guess < 0 || guess > 9) {
      setState(() {
        message = "Enter a valid number (0–9)!";
      });
      return;
    }

    setState(() {
      chances--;

      if (guess == answer) {
        message = "Correct, you win!";
        gameOver = true;
      } else if (chances == 0) {
        message = "Sorry, you lose. The answer is $answer";
        gameOver = true;
      } else if (guess < answer) {
        message = "$guess is too small, $chances chance(s) left!";
      } else {
        message = "$guess is too large, $chances chance(s) left!";
      }
    });

    guessController.clear();
  }

  void resetGame() {
    setState(() {
      answer = Random().nextInt(10);
      chances = 3;
      message = "";
      gameOver = false;
      guessController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Guess a number game",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 15),

            //Input
            SizedBox(
              width: 200,
              child: TextField(
                controller: guessController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Guess a number 0-9",
                  border: UnderlineInputBorder(),
                ),
                enabled: !gameOver,
              ),
            ),

            //result message
            if (message.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            const SizedBox(height: 20),

            //button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.pink.shade50,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: checkGuess,
              child: Text(gameOver ? "Replay" : "Guess"),
            ),
          ],
        ),
      ),
    );
  }
}