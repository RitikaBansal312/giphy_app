import 'package:http/http.dart' as http;
import 'dart:convert';

class GiphyService {
  final String apiKey = 'YOUR_GIPHY_API_KEY';

  Future<List> getTrendingGifs() async {
    final response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&limit=25'));
    return json.decode(response.body)['data'];
  }

  Future<List> searchGifs(String query) async {
    final response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=25'));
    return json.decode(response.body)['data'];
  }
}
