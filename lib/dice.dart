import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var dice1 = 'image/dice1.png';
  var dice2 = 'image/dice2.png';
  var total = 3;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('Dice Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(dice1)),
                    const SizedBox(width: 25),
                    Expanded(child: Image.asset(dice2)),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var no1 = random.nextInt(6) + 1;
                    var no2 = Random().nextInt(6) + 1;
                    setState(() {
                      dice1 = 'image/dice$no1.png';
                      dice2 = 'image/dice$no2.png';
                      total = no1 + no2;
                    });
                    showToast(' Left: $no1,  Right: $no2 ');
                  },
                  child: const Icon(Icons.play_arrow_rounded, size: 60)),
              const SizedBox(height: 50),
              Text('총 합계 :  $total'),
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT, // 얼마동안 보여지나
    gravity: ToastGravity.BOTTOM,
  );
}
