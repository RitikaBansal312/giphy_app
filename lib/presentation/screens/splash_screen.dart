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
      child: Center(
        child: Image.asset(
          alignment: Alignment.center,
          AppImages.splashImage, // Path to your image
          width: MediaQuery.of(context)
              .size
              .width, // Optional: Set width for your image
          height: MediaQuery.of(context)
              .size
              .height, // Optional: Set height for your image
          // fit: BoxFit.contain, // Ensures image scaling fits
        ),
      ),
    ));
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage(AppImages.splashImage),
//                 alignment: Alignment.center,
//               ),
//             ],
//           ),
//         ],
//       ),