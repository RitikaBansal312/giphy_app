import 'package:get/get.dart';
import '../services/giphy_service.dart';

class GiphyController extends GetxController {
  var gifs = [].obs;
  var isLoading = false.obs;

  void getTrendingGifs() async {
    isLoading(true);
    var fetchedGifs = await GiphyService().getTrendingGifs();
    gifs.value = fetchedGifs;
    isLoading(false);
  }

  void searchGifs(String query) async {
    isLoading(true);
    var fetchedGifs = await GiphyService().searchGifs(query);
    gifs.value = fetchedGifs;
    isLoading(false);
  }
}
