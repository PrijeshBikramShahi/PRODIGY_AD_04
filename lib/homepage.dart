import 'package:flutter/material.dart';
import 'package:xoxo/utils/box.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int oTurn = 0;
  List<String> xoList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void onXOTap(int index) {
    setState(() {
      if (xoList[index] == '') {
        oTurn++;
        if (oTurn % 2 == 0) {
          setState(() {
            xoList[index] = 'O';
          });
        } else {
          setState(() {
            xoList[index] = 'X';
          });
        }
      checkForWinner();
      }
    });
  }

  void checkForWinner() {
    for (int i = 0; i < 3; i++) {
      if (xoList[i][0] != '-' &&
          xoList[i][0] == xoList[i][1] &&
          xoList[i][0] == xoList[i][2]) {
        showWinnerScreen;
      }
    }
    for (int j = 0; j < 3; j++) {
      if (xoList[0][j] != '-' &&
          xoList[0][j] == xoList[1][j] &&
          xoList[1][j] == xoList[2][j]) {
        showWinnerScreen;
      }
    }
    if (xoList[0][0] != '-' &&
        xoList[0][0] == xoList[1][1] &&
        xoList[1][1] == xoList[2][2]) {
      showWinnerScreen;
    }
    if (xoList[0][2] != '-' &&
        xoList[0][2] == xoList[1][1] &&
        xoList[1][1] == xoList[2][0]) {
      showWinnerScreen;
    }
  }

  void showWinnerScreen() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("WINNER!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: const EdgeInsets.only(top:30.0).copyWith(left: 10,right: 10),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
        ));
  }
}
