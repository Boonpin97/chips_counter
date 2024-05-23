import 'package:chips_counter/widgets/denomination.dart';
import 'package:flutter/material.dart';
import '/pages/home.dart';
import 'pages/denominationPage.dart';
import 'class/players.dart';

List<Players> playersList = [
  Players("John"),
  Players("Doe"),
  // Players("Lily"),
  // Players("Emily"),
  // Players("Michael"),
  // Players("Sophia"),
  // Players("David"),
  // Players("Olivia"),
];

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      "/home": (context) => HomePage(playersList),
      "/chipPage": (context) => DenominationPage(playersList),
    },
  ));
}
