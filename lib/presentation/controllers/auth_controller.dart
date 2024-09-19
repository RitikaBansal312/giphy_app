import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/utils/app_storage.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AuthController extends GetxController {
  // Initializing Variables
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isAuthenticated = false.obs;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // SignIn Function
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Get the auth token
      String? token = await userCredential.user?.getIdToken();
      debugPrint(token);
      isAuthenticated.value = true;
      Get.offAll(HomeScreen());
      Get.snackbar("Logged In Successfully", "success: loggedin");
      AppStorage.saveToken1(token.toString());
    } catch (e) {
      Get.snackbar('Login failed', "Error: $e");
    }
  }

  // SignUp Function
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isAuthenticated.value = true;
      Get.offAll(LoginScreen());
      Get.snackbar("Signed Up Successfully", "success: signedup");
    } catch (e) {
      Get.snackbar('SignUp failed', "Error: $e");
    }
  }

  // SignOut Function
  Future<void> signOut() async {
    AppStorage.clearToken1();
    await _auth.signOut();
    isAuthenticated.value = false;
    Get.offAll(LoginScreen());
    Get.snackbar("Logged Out Successfully", "success: loggedout");
  }
}
