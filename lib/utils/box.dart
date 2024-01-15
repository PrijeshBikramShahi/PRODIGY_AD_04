import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TickBox extends StatelessWidget {
  TickBox({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.displayXO,
  });

  VoidCallback onTap;
  final int currentIndex;
  final List<String> displayXO;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withOpacity(0.2),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        height: 50,
        child: Center(
          child: Text(
            displayXO[currentIndex],
            style: TextStyle(
              fontSize: 34,
              color: (displayXO[currentIndex]=='X') ? Colors.redAccent : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
