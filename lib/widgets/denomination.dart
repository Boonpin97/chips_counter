import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/coin.dart';

List<String> denomination_list = [];

class Denomination extends StatefulWidget {
  const Denomination({super.key});

  @override
  State<Denomination> createState() => _DenominationState();
}

class _DenominationState extends State<Denomination> {
  var Controller = TextEditingController();

  void _removeValueHandler(int index) {
    print("Remove number: $index");
    setState(() {
      denomination_list.removeAt(index);
    });
  }

  void _addButtonFunction() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          color: Colors.green[500],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const Text(
                      "Enter chips value:",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[+-]?(\d+(\.\d*)?|\.\d+)$'))],
                      maxLength: 11,
                      controller: Controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[200],
                        ),
                        hintText: "Insert Here",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 50,
                      width: 100,
                      color: Colors.green[500],
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.check),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                          if (Controller.text.isNotEmpty) {
                            denomination_list.add(Controller.text);
                            denomination_list
                                .sort((a, b) => double.parse(a).compareTo(double.parse(b))); // sort the list
                            print(denomination_list);
                            setState(() {
                              Controller.text = "";
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Chip Values',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: denomination_list.length,
                itemBuilder: (context, index) {
                  return Coin(_removeValueHandler, denomination_list, index);
                },
              ),
            ),
            (denomination_list.length < 6)
                ? Container(
                    alignment: Alignment.center,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: _addButtonFunction,
                        child: Icon(Icons.add, color: Colors.green), // icon of the button
                        style: ElevatedButton.styleFrom(
                          // styling the button
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(1),
                          backgroundColor: Colors.white, // Button color
                        ),
                      ),
                    ]),
                  )
                : Container()
          ],
        ),
      ],
    );
  }
}
