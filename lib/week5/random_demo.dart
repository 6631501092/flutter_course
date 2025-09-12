import 'dart:math';
import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  String result = '';
  TextEditingController tcMin = TextEditingController();
  TextEditingController tcMax = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Random Integer Number',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 8),
              TextField(
                controller: tcMin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'min'),
              ),
              SizedBox(height: 8),
              TextField(
                controller: tcMax,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'max'),
              ),
              SizedBox(height: 16),
              Text(result, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 8),
              FilledButton(
                onPressed: () {
                  int? min = int.tryParse(tcMin.text);
                  int? max = int.tryParse(tcMax.text);
                  if (min == null || max == null || min > max) {
                    setState(() {
                      result = 'Please check your inputs';
                    });
                    return;
                  }
                  // generate a random number min to max
                  int num = min + Random().nextInt(max - min + 1);
                  setState(() {
                    result = num.toString();
                  });
                },
                child: const Text('Generate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
