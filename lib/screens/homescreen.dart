import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:xoxo/homepage.dart';
import 'package:xoxo/utils/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

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
                  style: Fonts.titleFontWhite,
                ),
                Text(
                  "XO",
                  style: Fonts.titleFont,
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
              padding: const EdgeInsets.only(top: 20.0, bottom: 60),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "START GAME",
                    style: Fonts.myNewFontWhite,
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
