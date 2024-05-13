import 'package:flutter/material.dart';

class Denomination extends StatefulWidget {
  const Denomination({super.key});

  @override
  State<Denomination> createState() => _DenominationState();
}

class _DenominationState extends State<Denomination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.green), // icon of the button
          style: ElevatedButton.styleFrom(
            // styling the button
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.white, // Button color
          ),
        ),
      ]),
    );
  }
}
