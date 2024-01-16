import 'package:flutter/material.dart';
import 'package:xoxo/utils/fonts.dart';
import 'package:xoxo/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.resetButton, required this.displayText});

  VoidCallback resetButton;
  final String displayText;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              displayText,
              textAlign: TextAlign.center,
              style: Fonts.myNewFontWhite,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              icon: Icons.restart_alt_rounded,
              onTap: () {
                resetButton();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
