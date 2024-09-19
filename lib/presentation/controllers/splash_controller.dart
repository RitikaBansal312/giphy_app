import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../data/utils/app_storage.dart";
import "../screens/home_screen.dart";
import "../screens/login_screen.dart";

class SplashController extends GetxController {
  // var getStorage = AppStorage();

  // Check Login
  checkLogin() async {
    // var token = getStorage.getToken() ?? "";
    var token = await AppStorage.getToken1();
    debugPrint("token = $token");
    if (token == "") {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(HomeScreen());
    }
  }

  // Launch Screen
  launchScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // Get.offAll(LoginScreen());
      checkLogin();
    });
  }
}
