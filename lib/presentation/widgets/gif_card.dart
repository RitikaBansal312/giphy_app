import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/gif_model.dart';
import '../controllers/giphy_controller.dart';
import '../controllers/auth_controller.dart';

class GifCard extends StatelessWidget {
  final GifModel gif;

  GifCard({required this.gif});

  final GifController gifController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final String userId = authController.firebaseUser.value!.uid;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(gif.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(gif.title),
                IconButton(
                  icon: Icon(
                    gif.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: gif.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    gifController.toggleFavorite(gif, userId);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
