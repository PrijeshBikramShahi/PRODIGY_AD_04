import 'package:flutter/material.dart';

class TickBox extends StatelessWidget {
  TickBox({
    super.key,
    required this.currentIndex,
    required this.onTap, required this.displayXO,
  });
  VoidCallback onTap;
  final int currentIndex;
  final List<String> displayXO;
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withOpacity(0.2),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        height: 50,
        child: Center(
          child: Text(
            displayXO[currentIndex],
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
