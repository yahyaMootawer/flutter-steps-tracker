import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Dialogs {
  static void pushLoadingDialog(Function onCancel) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          pushAreUSureDialog(
            "Cancel",
            "press ok to cancel the operation",
            () {
              onCancel();
              Get.back(); // for the loading dialog
            },
          );
          return false;
        },
        child: AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text(
                "Loading",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "kofi",
                ),
              )
            ],
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void pushAreUSureDialog(
    String title,
    String description,
    Function onSure,
  ) {
    Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.changa(
            color: Get.theme.primaryColor,
            fontSize: 22,
          ),
        ),
        content: Text(
          description,
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 16.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontFamily: 'kofi',
                fontSize: 16.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              onSure();
            },
            child: Text(
              'Sure',
              style: TextStyle(
                color: Get.theme.colorScheme.secondary,
                fontFamily: 'kofi',
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void pushInformationDialog(
      String infoMessage, String title, Function onOk) {
    Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.changa(
            color: Get.theme.primaryColor,
            fontSize: 22.0,
          ),
        ),
        content: Text(
          infoMessage,
          style: GoogleFonts.changa(
            fontSize: 16.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              onOk();
            },
            child: Text(
              'Ok',
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontFamily: 'kofi',
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
