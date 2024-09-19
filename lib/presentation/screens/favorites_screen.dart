import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/giphy_controller.dart';
import '../widgets/gif_card.dart';

class FavoritesScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final GifController gifController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Obx(() {
        if (gifController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: gifController.gifs.length,
          itemBuilder: (context, index) {
            final gif = gifController.gifs[index];
            return GifCard(gif: gif);
          },
        );
      }),
    );
  }
}
