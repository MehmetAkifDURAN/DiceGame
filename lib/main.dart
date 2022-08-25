import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Game",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _dice1;
  int? _dice2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zar Oyunu"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: rollDice,
        child: const Text("Zar at"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: setColor(value: _dice1),
              alignment: Alignment.center,
              child: buildText(value: _dice1),
            ),
            Container(
              width: 100,
              height: 100,
              color: setColor(value: _dice2),
              alignment: Alignment.center,
              child: buildText(value: _dice2),
            )
          ],
        ),
      ),
    );
  }

  rollDice() {
    setState(() {
      _dice1 = Random().nextInt(6) + 1;
      _dice2 = Random().nextInt(6) + 1;
    });
  }

  Color setColor({int? value}) {
    List<Color> colors = <Color>[
      Colors.purple.shade300,
      Colors.purple.shade400,
      Colors.purple.shade500,
      Colors.purple.shade600,
      Colors.purple.shade700,
      Colors.purple.shade800,
      Colors.purple.shade900
    ];
    if (value == null) {
      return colors[0];
    }
    return colors[value];
  }

  Text buildText({int? value}) {
    if (value == null) {
      return const Text("");
    }
    return Text(
      value.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 72,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
