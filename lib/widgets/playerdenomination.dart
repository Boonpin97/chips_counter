import 'package:chips_counter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/widgets/playercard.dart';
import '/class/players.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const titleHeight = 0.1;
const addButtonHeight = 0.08;

class PlayerDenomination extends StatefulWidget {
  List<double> denominationList;

  PlayerDenomination(this.denominationList, {Key? key}) : super(key: key);

  @override
  _PlayerDenominationState createState() => _PlayerDenominationState(denominationList);
}

class _PlayerDenominationState extends State<PlayerDenomination> {
  var controller = TextEditingController();
  List<double> denominationList;

  _PlayerDenominationState(this.denominationList);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
      alignment: Alignment.center,
      width: screenWidth * whiteAreaWidth,
      height: screenHeight * whiteAreaHeight,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: screenWidth * whiteAreaWidth / 2,
                height: screenHeight * whiteAreaHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Denomination',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline),
                ),
              ),
              Container(
                width: screenWidth * whiteAreaWidth / 2,
                height: screenHeight * whiteAreaHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
