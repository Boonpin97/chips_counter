import 'package:flutter/material.dart';

List<Color> coin_color = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange, Colors.grey];

class Coin extends StatelessWidget {
  int index;
  List<String> denomination_list;
  final Function _handleValue;

  Coin(this._handleValue, this.denomination_list, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => _handleValue(index),
        child: Text("${denomination_list[index]}"), // icon of the button
        style: ElevatedButton.styleFrom(
          // styling the button
          shape: CircleBorder(),
          padding: EdgeInsets.all(1),
          backgroundColor: coin_color[index], // Button color
        ),
      ),
    );
  }
}
