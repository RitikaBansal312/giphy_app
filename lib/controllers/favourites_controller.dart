import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var favorites = [].obs;

  void addFavorite(String gifUrl) async {
    var user = auth.currentUser;
    await firestore.collection('favorites').doc(user!.uid).set({
      'favorites': FieldValue.arrayUnion([gifUrl])
    });
    getFavorites();
  }

  void getFavorites() async {
    var user = auth.currentUser;
    var doc = await firestore.collection('favorites').doc(user!.uid).get();
    favorites.value = doc['favorites'] ?? [];
  }
}
