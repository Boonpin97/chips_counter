import 'package:chips_counter/widgets/denomination.dart';
import 'package:flutter/material.dart';
import '/widgets/base.dart';
import '/widgets/denomination.dart';

class HomePage extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDEDB8),
        appBar: AppBar(
          title: const Text(
            'Chips Counter',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          backgroundColor: Color(0xFF10E99A),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Base(),
                SizedBox(height: 10),
                Denomination(),
              ],
            ),
          ),
        ));
  }
}
