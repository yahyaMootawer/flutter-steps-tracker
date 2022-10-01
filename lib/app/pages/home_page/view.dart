import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_steps_tracker/app/pages/home_page/rewards_catalog_screen.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/walking_screen.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/wallet_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffF7F7F7),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAppBar(context),
              Expanded(
                  child: IndexedStack(
                index: _currentIdx,
                children: const [
                  WalkingScreen(),
                  WalletScreen(),
                  RewardsCatalogScreen(),
                ],
              )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIdx,
            onTap: (value) => setState(() {
              _currentIdx = value;
            }),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.nordic_walking),
                label: "Walking",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.self_improvement,
                ),
                label: "Exchange portal",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.self_improvement,
                ),
                label: "Hisory",
              ),
            ],
          )),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: kToolbarHeight,
          width: double.infinity,
          color: const Color(0xff103386),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              Text(
                ["Walking Page", "Wallet", "Reweards Catalog"][_currentIdx],
                style: GoogleFonts.changa(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
