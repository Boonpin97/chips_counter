import 'package:chips_counter/widgets/calculatebutton.dart';
import 'package:flutter/material.dart';
import '/widgets/base.dart';
import '/widgets/denomination.dart';
import '/widgets/playerbuyin.dart';
import '/widgets/calculatebutton.dart';
import '/class/players.dart';

const double boxSpacing = 0.01;

double base = 0.0;
List<Players> playersList = [
  // Players("John"),
  // Players("Doe"),
  // Players("Lily"),
  // Players("Emily"),
  // Players("Michael"),
  // Players("Sophia"),
  // Players("David"),
  // Players("Olivia"),
];

class HomePage extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  void updateBase(input) {
    setState(() {
      base = double.parse(input);
      for (int i = 0; i < playersList.length; i++) {
        playersList[i].base = base;
        playersList[i].updateValues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFEDEDB8),
        appBar: AppBar(
          title: const Text(
            'Chips Counter',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          backgroundColor: const Color(0xFF10E99A),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Base(updateBase),
              SizedBox(height: screenHeight * boxSpacing),
              const Denomination(),
              SizedBox(height: screenHeight * boxSpacing),
              PlayerBuyIn(base, playersList),
              const CalculateButton(),
            ],
          ),
        ));
  }
}
