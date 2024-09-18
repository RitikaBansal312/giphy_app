import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphy_app/controllers/gif_controller.dart';
import '../controllers/favourites_controller.dart';

class HomeScreen extends StatelessWidget {
  final GiphyController giphyController = Get.put(GiphyController());
  final searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            if (value.isEmpty) {
              giphyController.getTrendingGifs();
            } else {
              giphyController.searchGifs(value);
            }
          },
          decoration: const InputDecoration(hintText: "Search GIFs"),
        ),
      ),
      body: Obx(() {
        if (giphyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: giphyController.gifs.length,
          itemBuilder: (context, index) {
            var gifUrl = giphyController.gifs[index]['images']['fixed_height']['url'];
            return GestureDetector(
              onLongPress: () => FavoritesController().addFavorite(gifUrl),
              child: Image.network(gifUrl),
            );
          },
        );
      }),
    );
  }
}
