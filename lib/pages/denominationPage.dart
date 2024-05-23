import 'package:chips_counter/widgets/denomination.dart';
import 'package:flutter/material.dart';
import '/widgets/playerdenomination.dart';
import '/class/players.dart';
import '/params.dart';

const double boxSpacing = 0.01;
const double playerNameSpacing = 0.05;
const double summarySpacing = 0.2;

class DenominationPage extends StatefulWidget {
  List<Players> playersList;
  DenominationPage(this.playersList, {Key? key}) : super(key: key);

  @override
  State<DenominationPage> createState() => _DenominationPageState(playersList);
}

class _DenominationPageState extends State<DenominationPage> {
  List<Players> playersList;
  _DenominationPageState(this.playersList);
  void _setStateHandler() {
    for (int i = 0; i < playersList.length; i++) {
      playersList[i].updateValues();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                alignment: Alignment.center,
                child: Text(
                  playersList[args.index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: screenHeight * boxSpacing),
              PlayerDenomination(playersList[args.index], _setStateHandler),
              SizedBox(height: screenHeight * boxSpacing),
              Container(
                width: screenWidth,
                height: screenHeight * summarySpacing,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Chips Value: ${playersList[args.index].total.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      "Earnings: ${playersList[args.index].earning.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
