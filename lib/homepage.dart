import 'package:flutter/material.dart';
import 'package:xoxo/utils/box.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int oTurn = 0;
  List<String> xoList = ['', '', '', '', '', '', '', '', ''];

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
        checkForWinner(index);
      }
    });
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

  void showWinnerScreen() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("WINNER!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cosmic",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                "XO",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0)
                    .copyWith(left: 10, right: 10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
            Row(
              children: [Container()],
            ),
          ],
        ));
  }
}
