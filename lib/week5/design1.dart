import 'package:flutter/material.dart';

class Design1 extends StatelessWidget {
  const Design1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(color: Colors.red, width: 100),
          Expanded(
            child: Container(
              color: Colors.teal,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, height: 100, color: Colors.yellow),
                  Container(width: 100, height: 100, color: Colors.green),
                ],
              ),
            ),
          ),
          Container(color: Colors.blue, width: 100),
        ],
      ),
    );
  }
}
