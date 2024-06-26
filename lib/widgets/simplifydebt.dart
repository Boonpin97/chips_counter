import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/class/players.dart';

class SimplifyDebt extends StatelessWidget {
  List<Players> playersList;
  SimplifyDebt(this.playersList, {Key? key}) : super(key: key);

  String settleDebts(List<Players> players) {
    // Split players into givers and receivers
    String returnString = "";
    List<Players> givers = [];
    List<Players> receivers = [];

    givers = players.where((player) => player.earning < 0).toList();
    receivers = players.where((player) => player.earning > 0).toList();
    givers.sort((b, a) => a.earning.compareTo(b.earning));
    receivers.sort((a, b) => a.earning.compareTo(b.earning));
    double net = 0;
    for (Players player in playersList) {
      net += player.earning;
    }
    if (net != 0.0) {
      returnString = "Earnings doesn't tally";
      print("Earnings doesn't tally");
      return returnString;
    }
    int givers_index = 0;
    int receivers_index = 0;

    while (givers_index < givers.length && receivers_index < receivers.length) {
      if (givers[givers_index].earning.abs() == receivers[receivers_index].earning) {
        returnString += (givers[givers_index].name +
            " --> " +
            receivers[receivers_index].name +
            " " +
            receivers[receivers_index].earning.toString() +
            "\n");
        givers.removeAt(givers_index);
        receivers.removeAt(receivers_index);
      }
      givers_index++;
      if (givers_index > givers.length - 1) {
        givers_index = 0;
        receivers_index++;
      }
    }
    givers_index = 0;
    receivers_index = 0;
    while (givers_index < givers.length && receivers_index < receivers.length) {
      if (givers[givers_index].earning.abs() == receivers[receivers_index].earning) {
        returnString += (givers[givers_index].name +
            " --> " +
            receivers[receivers_index].name +
            " " +
            receivers[receivers_index].earning.toString() +
            "\n");
        givers.removeAt(givers_index);
        receivers.removeAt(receivers_index);
      } else if (givers[givers_index].earning.abs() <= receivers[receivers_index].earning) {
        returnString += (givers[givers_index].name +
            " --> " +
            receivers[receivers_index].name +
            " " +
            givers[givers_index].earning.abs().toString() +
            "\n");
        receivers[receivers_index].earning -= givers[givers_index].earning.abs();
        givers.removeAt(givers_index);
      } else if (givers[givers_index].earning.abs() > receivers[receivers_index].earning) {
        returnString += (givers[givers_index].name +
            " --> " +
            receivers[receivers_index].name +
            " " +
            receivers[receivers_index].earning.toString() +
            "\n");
        givers[givers_index].earning += receivers[receivers_index].earning;
        receivers.removeAt(receivers_index);
      } else {
        givers_index++;
        if (givers_index > givers.length - 1) {
          givers_index = 0;
          receivers_index++;
        }
      }
      // print("-------------------");
      // for (Players giver in givers) {
      //   print("${giver.name}: ${giver.earning}");
      // }
      // for (Players receiver in receivers) {
      //   print("${receiver.name}: ${receiver.earning}");
      // }

      // print("R index: $receivers_index, G index: $givers_index");
      // print("-------------------");

      // print("Number of givers left: ${givers.length}");
      // print("Number of receivers left: ${receivers.length}");
    }
    return returnString;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      settleDebts(playersList),
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }
}
