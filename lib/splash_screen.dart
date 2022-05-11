import 'package:e_project/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:shimmer/shimmer.dart';

import 'log_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const NavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Shimmer.fromColors(
                  child: Text(
                    'Project of Ours',
                    style: GoogleFonts.pacifico(fontSize: 60, shadows: [
                      Shadow(
                        blurRadius: 18,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12),
                      )
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  baseColor: Colors.deepPurple,
                  highlightColor: Colors.purple,
                ),
              ],
            ),
          ],
        ));
  }
}
