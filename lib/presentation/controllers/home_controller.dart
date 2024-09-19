import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GiphyController extends GetxController {
  // Initializing Variables
  var trendingGifs = [].obs;
  var searchedGifs = [].obs;
  var isLoading = false.obs;
  int offset = 0;
  final int limit = 20;

  @override
  void onInit() {
    fetchTrendingGifs();
    super.onInit();
  }

  // Fetching Trending Gifs List
  void fetchTrendingGifs() async {
    isLoading(true);
    var response = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=YOUR_API_KEY&limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      trendingGifs.addAll(data['data']);
      offset += limit;
    }
    isLoading(false);
  }

  // Fetching Search Gifs List
  void searchGifs(String query) async {
    searchedGifs.clear();
    isLoading(true);
    var response = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/search?api_key=YOUR_API_KEY&q=$query&limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      searchedGifs.addAll(data['data']);
      offset += limit;
    }
    isLoading(false);
  }

  // Load More Gifs
  void loadMoreGifs() {
    if (searchedGifs.isNotEmpty) {
      // Continue search pagination
      searchGifs(searchedGifs[0]['title']);
    } else {
      // Continue trending pagination
      fetchTrendingGifs();
    }
  }
}
