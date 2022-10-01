import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            repeat: ImageRepeat.repeat,
            image: AssetImage("assets/images/moroccan-flower.png"),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "hello",
                child: Container(
                  height: 120,
                  width: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/splash_loader.gif"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Text(
                    "Step Counter",
                    style: GoogleFonts.changa(
                      fontSize: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    "Yahya's Edition",
                    style: GoogleFonts.changa(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
