import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isAuthenticated = false.obs;

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isAuthenticated.value = true;
    } catch (e) {
      Get.snackbar("Error", "Login failed: $e");
    }
  }

  void signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      isAuthenticated.value = true;
    } catch (e) {
      Get.snackbar("Error", "Signup failed: $e");
    }
  }

  void logout() async {
    await auth.signOut();
    isAuthenticated.value = false;
  }
}

