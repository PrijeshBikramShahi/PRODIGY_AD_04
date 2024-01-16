import 'package:flutter/material.dart';
import 'package:xoxo/utils/box.dart';
import 'package:xoxo/utils/my_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool oTurn = true;
  int filledBox = 0;
  String oName = 'Player 1';
  String xName = 'Player 2';
  List<String> xoList = ['', '', '', '', '', '', '', '', ''];

  void onXOTap(int index) {
    filledBox += 1;
    if (filledBox < 9) {
      setState(() {
        if (xoList[index] == '') {
          if (!oTurn) {
            setState(() {
              xoList[index] = 'O';
            });
          } else {
            setState(() {
              xoList[index] = 'X';
            });
          }
          checkForWinner(index);
        }
      });
      oTurn = !oTurn;
    } else {
      showDrawScreen();
    }
  }

  void checkForWinner(index) {
    if (xoList[0] != '' && xoList[0] == xoList[1] && xoList[0] == xoList[2]) {
      showWinnerScreen();
    }
    if (xoList[3] != '' && xoList[3] == xoList[4] && xoList[3] == xoList[5]) {
      showWinnerScreen();
    }
    if (xoList[6] != '' && xoList[6] == xoList[7] && xoList[6] == xoList[8]) {
      showWinnerScreen();
    }
    if (xoList[0] != '' && xoList[0] == xoList[3] && xoList[0] == xoList[6]) {
      showWinnerScreen();
    }
    if (xoList[1] != '' && xoList[1] == xoList[4] && xoList[1] == xoList[7]) {
      showWinnerScreen();
    }
    if (xoList[2] != '' && xoList[2] == xoList[5] && xoList[2] == xoList[8]) {
      showWinnerScreen();
    }
    if (xoList[0] != '' && xoList[0] == xoList[4] && xoList[0] == xoList[8]) {
      showWinnerScreen();
    }
    if (xoList[6] != '' && xoList[6] == xoList[4] && xoList[6] == xoList[2]) {
      showWinnerScreen();
    }
  }

  void showDrawScreen() {
    String winner = oTurn ? oName : xName;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[900]),
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Draw! Try again?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  icon: Icons.restart_alt_rounded,
                  onTap: () {
                    onResetButton();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showWinnerScreen() {
    String winner = oTurn ? oName : xName;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[900]),
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "WINNER!!! $winner",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  icon: Icons.restart_alt_rounded,
                  onTap: () {
                    onResetButton();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onResetButton() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        xoList[i] = '';
      }
      oTurn = !oTurn;
      filledBox = 0;
    });
  }

  void onNewButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cosmic",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "XO",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    oTurn ? "$oName" : "$xName",
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                    ),
                  ),
                  const Text(
                    "'s turn",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0)
                    .copyWith(left: 10, right: 10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return TickBox(
                      displayXO: xoList,
                      onTap: () {
                        onXOTap(index);
                      },
                      currentIndex: index,
                    );
                  },
                ),
              ),
            ),
            MyButton(
              icon: Icons.restart_alt_rounded,
              onTap: onResetButton,
            ),
          ],
        ));
  }
}
