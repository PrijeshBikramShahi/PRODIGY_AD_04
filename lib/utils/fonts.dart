import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts{
  static var titleFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.redAccent, letterSpacing: 2, fontSize: 40));
  static var titleFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 40));
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.redAccent, letterSpacing: 2, fontSize: 20));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 20));
}