import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/giphy_controller.dart';
import 'favorites_screen.dart';
// import '../widgets/search_bar.dart';
// import '../widgets/gif_card.dart';

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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search GIFs',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                gifController.searchGifs(value);
              },
            ),
          ),
          SizedBox(height: 20),
          // SearchBar(onSearch: gifController.searchGifs),
          Obx(() {
            if (gifController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return Expanded(
              child: ListView.builder(
                itemCount: (gifController.gifs.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final gif = gifController.gifs[index];

                  //  itemCount: (imageUrls.length / 2).ceil(),

                  int firstImageIndex = index * 2;
                  int secondImageIndex = firstImageIndex + 1;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            gifController.gifs[firstImageIndex].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10), // Space between images
                        Expanded(
                          child: secondImageIndex < gifController.gifs.length
                              ? Image.network(
                                  gifController.gifs[secondImageIndex].url,
                                  fit: BoxFit.cover,
                                )
                              : Container(), // Empty container if no second image
                        ),
                      ],
                    ),
                  );
                  // return GifCard(gif: gif);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
