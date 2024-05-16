import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Base extends StatelessWidget {
  var controller = TextEditingController();
  Function updateBaseHandler;
  Base(this.updateBaseHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        const Text(
          'Base',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(
          height: 35,
          width: 120,
          child: TextField(
            onSubmitted: (value) => updateBaseHandler(value),
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.values[2],
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(bottom: 0),
                fillColor: Colors.white,
                filled: true),
          ),
        )
      ]),
    );
  }
}
