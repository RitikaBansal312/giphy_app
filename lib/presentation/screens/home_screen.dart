import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/giphy_controller.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GifController gifController = Get.put(GifController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String userId = authController.firebaseUser.value!.uid;
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
                  int firstImageIndex = index * 2;
                  int secondImageIndex = firstImageIndex + 1;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    gifController.gifs[firstImageIndex].url,
                                    fit: BoxFit.cover,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      gifController
                                              .gifs[firstImageIndex].isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: gifController
                                              .gifs[firstImageIndex].isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      gifController.toggleFavorite(
                                          gifController.gifs[firstImageIndex],
                                          userId);
                                    },
                                  ),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: Text(gif.title),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10), // Space between images
                        Expanded(
                          child: secondImageIndex < gifController.gifs.length
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.network(
                                          gifController
                                              .gifs[secondImageIndex].url,
                                          fit: BoxFit.cover,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            gifController.gifs[secondImageIndex]
                                                    .isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: gifController
                                                    .gifs[secondImageIndex]
                                                    .isFavorite
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            gifController.toggleFavorite(
                                                gifController
                                                    .gifs[secondImageIndex],
                                                userId);
                                          },
                                        ),
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(4.0),
                                    //   child: Text(gif.title),
                                    // ),
                                  ],
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
