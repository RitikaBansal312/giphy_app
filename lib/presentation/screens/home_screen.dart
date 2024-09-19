import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/giphy_controller.dart';
// import '../widgets/search_bar.dart';
import '../widgets/gif_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GifController gifController = Get.put(GifController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giphy App'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Get.to(() => FavoritesScreen()),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search GIFs',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              gifController.searchGifs(value);
            },
          ),
          // SearchBar(onSearch: gifController.searchGifs),
          Obx(() {
            if (gifController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return Expanded(
              child: ListView.builder(
                itemCount: gifController.gifs.length,
                itemBuilder: (context, index) {
                  final gif = gifController.gifs[index];
                  return GifCard(gif: gif);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
