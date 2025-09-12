import 'package:flutter/material.dart';

class SingleChildDemo extends StatelessWidget {
  const SingleChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('My app'),),
      body: SafeArea(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          alignment: Alignment(-0.5, 1),
          child: Icon(Icons.heart_broken, color: Colors.red),
        ),
      ),
    );
  }
}
