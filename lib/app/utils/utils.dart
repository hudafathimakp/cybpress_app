import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class Utils {
  static preventLandscapeOrientation() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static snackBar(String title, String message, {String type = 'eroor'}) {
    type == 'eroor'
        ? Get.snackbar(
            title,
            message,
            icon: const Icon(Icons.error, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.primary,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            maxWidth: GetPlatform.isDesktop || GetPlatform.isWeb
                ? Get.width * .3
                : null,
            dismissDirection: DismissDirection.startToEnd,
            forwardAnimationCurve: Curves.easeOutBack,
          )
        : Get.snackbar(
            title,
            message,
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            maxWidth: GetPlatform.isDesktop || GetPlatform.isWeb
                ? Get.width * .3
                : null,
            dismissDirection: DismissDirection.startToEnd,
            forwardAnimationCurve: Curves.easeOutBack,
          );
  }
}
