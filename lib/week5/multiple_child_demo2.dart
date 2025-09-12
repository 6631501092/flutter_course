import 'package:flutter/material.dart';

class MultipleChildDemo2 extends StatelessWidget {
  const MultipleChildDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          //children: [
          //Container(width: 100,height: 100,color: Colors.green,),
          //Container(width: 100,height: 200,color: Colors.yellow,),
          // Container(width: 100,height: 100,color: Colors.red,)
          //],
          //children: [
          //Expanded(
          //flex: 1,
          //child: Container(width: 100, height: 100, color: Colors.green)),
          //Container(width: 100, height: 200, color: Colors.yellow)         ,
          //Expanded(
          //flex: 2,
          //child: Container(width: 100, height: 100, color: Colors.red)),
          //],
          //],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(flex: 1),
            Container(width: 100, height: 100, color: Colors.green),
            Container(width: 200, height: 200, color: Colors.yellow),
            Spacer(flex: 2),
            Container(width: 100, height: 100, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
