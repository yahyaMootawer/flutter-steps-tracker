import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/pages/sign_up/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlller = Get.find<SignupController>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.3,
                repeat: ImageRepeat.repeat,
                image: AssetImage("assets/images/moroccan-flower.png"),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "hello",
                  child: Container(
                    height: 120 / 2,
                    width: 240 / 2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/splash_loader.gif"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Welcome to the app",
                  style: GoogleFonts.changa(
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Enter your name and let's start",
                  style: GoogleFonts.cairo(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: 200,
                  child: TextField(
                    controller: controlller.nameFieldController,
                    decoration: InputDecoration(
                      labelText: "ادخل اسمك هنا",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 200,
                  height: 60,
                  child: Obx(() {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: controlller.isLoading.value
                          ? null
                          : () => controlller.signup(),
                      child: Text(
                        "تسجل و متابعة",
                        style: GoogleFonts.cairo(),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
