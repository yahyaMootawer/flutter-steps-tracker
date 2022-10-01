import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/rewards_catalog_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardsCatalogScreen extends StatelessWidget {
  const RewardsCatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RewardsCatalogScreenController controller = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              // height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Exchange your points with things u love",
                    style: GoogleFonts.changa(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Enjoy your achiments ",
                    style: GoogleFonts.cairo(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.rewards.length,
              itemBuilder: (BuildContext context, int index) {
                final reward = controller.rewards[index];
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xff103386),
                              width: 0.5,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(reward.imageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                reward.name,
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Enjoy this with only ${reward.price} health points ",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              OutlinedButton(
                                onPressed: () => controller.redeem(reward),
                                child: Text("Reedeme"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }
}
