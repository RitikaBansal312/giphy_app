import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../data/models/gif_model.dart';
import '../../data/services/giphy_provider.dart';

class GifController extends GetxController {
  var gifs = <GifModel>[].obs;
  var isLoading = false.obs;
  var searchTerm = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchTrendingGifs();
  }

  // Trending Gifs
  void fetchTrendingGifs() async {
    isLoading(true);
    try {
      final response = await _apiService.fetchTrendingGifs();
      gifs.value = response;
    } finally {
      isLoading(false);
    }
  }

  // Search Gifs
  void searchGifs(String term) async {
    searchTerm.value = term;
    isLoading(true);
    try {
      final response = await _apiService.searchGifs(term);
      gifs.value = response;
    } finally {
      isLoading(false);
    }
  }

  // Fetch favorite GIFs from Firestore for the current user
  Future<void> fetchFavoriteGifs(String userId) async {
    isLoading(true);
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .get();

      List<GifModel> favoriteGifs = snapshot.docs.map((doc) {
        return GifModel(
          id: doc['id'],
          url: doc['url'],
          title: doc['title'],
        );
      }).toList();

      gifs.value = favoriteGifs;
    } finally {
      isLoading(false);
    }
  }

  // Add or remove a GIF from favorites
  Future<void> toggleFavorite(GifModel gif, String userId) async {
    final userFavoritesRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(gif.id);

    gif.isFavorite = !gif.isFavorite; // Toggle favorite status

    if (gif.isFavorite) {
      await userFavoritesRef.set(gif.toMap()); // Add to Firestore
    } else {
      await userFavoritesRef.delete(); // Remove from Firestore
    }

    // Update the list to reflect the favorite status change
    gifs.refresh();
  }
}
