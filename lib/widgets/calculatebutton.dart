import 'package:flutter/material.dart';

const double buttonWidth = 0.8;

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * buttonWidth,
      child: ElevatedButton(
          onPressed: () {},
          child: const Text('Calculate',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ))),
    );
  }
}
