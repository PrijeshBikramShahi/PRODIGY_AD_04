import 'package:flutter/material.dart';
import 'package:xoxo/screens/dialog_box.dart';
import 'package:xoxo/utils/appbar_title.dart';
import 'package:xoxo/utils/box.dart';
import 'package:xoxo/utils/fonts.dart';
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
    if (xoList[index] == '') {
      filledBox += 1;
    }
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
          oTurn = !oTurn;
        }
      });
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          content: DialogBox(
            resetButton: onResetButton,
            displayText: "Draw! Try again?",
          )),
    );
  }

  void showWinnerScreen() {
    String winner = oTurn ? oName : xName;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          content: DialogBox(
              resetButton: onResetButton, displayText: "WINNER!!! $winner")),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          title: AppBarTitle(),
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(oTurn ? oName : xName, style: Fonts.myNewFont),
                  Text(
                    "'s turn",
                    style: Fonts.myNewFontWhite,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0)
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
            const SizedBox(
              height: 40,
            ),
            MyButton(
              icon: Icons.restart_alt_rounded,
              onTap: onResetButton,
            ),
          ],
        ));
  }
}
