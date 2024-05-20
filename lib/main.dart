import 'package:flutter/material.dart';
import '/pages/home.dart';
import 'pages/denominationPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      "/home": (context) => DenominationPage("Boon Pin"),
    },
  ));
}
