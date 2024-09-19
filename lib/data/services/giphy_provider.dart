import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/gif_model.dart';

class ApiService {
  // Giphy API Key
  final String apiKey = 'tGXDhEofgALm5Dt33YyCjcGQ2iBbkdEu';
  // API Base URL
  final String baseUrl = 'https://api.giphy.com/v1/gifs';

  // Fetching Trending Gifs List
  Future<List<GifModel>> fetchTrendingGifs() async {
    final response =
        await http.get(Uri.parse('$baseUrl/trending?api_key=$apiKey&limit=20'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => GifModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trending GIFs');
    }
  }

  // Fetching Search Gifs List
  Future<List<GifModel>> searchGifs(String query) async {
    final response = await http
        .get(Uri.parse('$baseUrl/search?api_key=$apiKey&q=$query&limit=20'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => GifModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search GIFs');
    }
  }
}
