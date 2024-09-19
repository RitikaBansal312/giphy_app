import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/utils/app_image.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var splashController = Get.put(SplashController());
    splashController.launchScreen();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage(AppImages.splashImage),
            alignment: Alignment.center,
          ),
        ],
      ),
    ));
  }
}
