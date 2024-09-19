import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/giphy_controller.dart';
import '../widgets/gif_card.dart';

class FavoritesScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GifController gifController = Get.put(GifController());

  @override
  Widget build(BuildContext context) {
    final String userId = authController.firebaseUser.value!.uid;

    // Fetch the user's favorite GIFs from Firestore
    gifController.fetchFavoriteGifs(userId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (gifController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (gifController.gifs.isEmpty) {
          return const Center(child: Text('No favorites added.'));
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
