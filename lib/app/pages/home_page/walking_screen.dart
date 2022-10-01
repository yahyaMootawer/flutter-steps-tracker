import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/data_sources/pedometer_source.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/controller.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalkingScreen extends StatelessWidget {
  const WalkingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff103386),
            Color(0xff2a5298),
          ],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight / 4,
            ),
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
                      Text.rich(
                        TextSpan(
                          text: "Hey ",
                          children: [
                            TextSpan(
                              text: Get.find<AuthService>().authUser.name,
                              style: GoogleFonts.changa(
                                color: const Color(0xff103386),
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        style: GoogleFonts.changa(
                          fontSize: 18,
                        ),
                      ),
                      Obx(() {
                        return Text(
                          controller.walkingStatus.value ==
                                  WalkingStatus.stopped
                              ? "Why you stopped ? keep walking and gain more points !"
                              : "Coool Keep walking and gain more !",
                          style: GoogleFonts.cairo(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(
                      Get.find<HomePageController>().steps.toString(),
                      style: GoogleFonts.changa(
                        fontSize: 84,
                        color: Colors.white,
                      ),
                    );
                  }),
                  Text(
                    "Your overall step count",
                    style: GoogleFonts.changa(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
