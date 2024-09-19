import 'package:get/get.dart';
import '../../data/models/gif_model.dart';
import '../../data/services/giphy_provider.dart';

class GifController extends GetxController {
  var gifs = <GifModel>[].obs;
  var isLoading = false.obs;
  var searchTerm = ''.obs;

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
}
