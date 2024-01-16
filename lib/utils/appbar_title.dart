import 'package:flutter/material.dart';
import 'package:xoxo/utils/fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "XO",
                  textAlign: TextAlign.center,
                  style: Fonts.titleFontWhite,
                ),
                Text(
                  "XO",
                  textAlign: TextAlign.center,
                  style: Fonts.titleFont,
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
          );
  }
}