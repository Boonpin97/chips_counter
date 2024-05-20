import 'package:flutter/material.dart';
import '/widgets/playerdenomination.dart';

const double boxSpacing = 0.01;
const double playerNameSpacing = 0.05;

class DenominationPage extends StatefulWidget {
  String playerName;
  DenominationPage(this.playerName);

  @override
  State<DenominationPage> createState() => _DenominationPageState(playerName);
}

class _DenominationPageState extends State<DenominationPage> {
  String playerName;
  _DenominationPageState(this.playerName);
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
              Container(
                width: screenWidth,
                height: screenHeight * playerNameSpacing,
                child: Text(
                  playerName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: screenHeight * boxSpacing),
              PlayerDenomination([0.1, 0.2, 1.0]),
            ],
          ),
        ));
  }
}
