import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xoxo/homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "XO",
                  style: titleFontWhite,
                ),
                Text(
                  "XO",
                  style: titleFont,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: AvatarGlow(
                glowRadiusFactor: 0.5,
                curve: Curves.easeOutCirc,
                glowCount: 2,
                duration: const Duration(milliseconds: 2000),
                // glowColor: Color.fromARGB(26, 255, 82, 82).withOpacity(0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/xoxo.jpeg")),
                      borderRadius: BorderRadius.circular(150)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Homepage()));
                },
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "START GAME",
                    style: myNewFontWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
