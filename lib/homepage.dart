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
  String playerName = 'Player 1';
  List<String> emptyList = ['', '', '', '', '', '', '', '', ''];
  List<String> xoList = ['', '', '', '', '', '', '', '', ''];

  void onXOTap(int index) {
    setState(() {
      
      if (xoList[index] == '') {
        if (!oTurn) {
          setState(() {
            playerName = "Player 1";
            xoList[index] = 'O';
            
          });
        } else {
          setState(() {
            playerName = "Player 2";
            xoList[index] = 'X';

          });
        }
        checkForWinner(index);
        oTurn = !oTurn;
      }
    });
  }

  void checkForWinner(index) {
    if (xoList[0] != '' && xoList[0] == xoList[1] && xoList[0] == xoList[2]) {
      showWinnerScreen(playerName);
    }
    if (xoList[3] != '' && xoList[3] == xoList[4] && xoList[3] == xoList[5]) {
      showWinnerScreen(playerName);
    }
    if (xoList[6] != '' && xoList[6] == xoList[7] && xoList[6] == xoList[8]) {
      showWinnerScreen(playerName);
    }
    if (xoList[0] != '' && xoList[0] == xoList[3] && xoList[0] == xoList[6]) {
      showWinnerScreen(playerName);
    }
    if (xoList[1] != '' && xoList[1] == xoList[4] && xoList[1] == xoList[7]) {
      showWinnerScreen(playerName);
    }
    if (xoList[2] != '' && xoList[2] == xoList[5] && xoList[2] == xoList[8]) {
      showWinnerScreen(playerName);
    }
    if (xoList[0] != '' && xoList[0] == xoList[4] && xoList[0] == xoList[8]) {
      showWinnerScreen(playerName);
    }
    if (xoList[6] != '' && xoList[6] == xoList[4] && xoList[6] == xoList[2]) {
      showWinnerScreen(playerName);
    }
  }

  void showWinnerScreen(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 300,
          child: Column(
            children: [
              Text("WINNER!!! $name"),
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
    );
  }

  void onResetButton() {
    setState(() {
      xoList = emptyList;
      oTurn = true;
      playerName = 'Player 1';
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
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$playerName",
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
