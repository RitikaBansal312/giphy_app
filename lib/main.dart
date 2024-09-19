import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Firebase
  await Firebase.initializeApp();
  // Initializing GetStorage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giphy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Navigation to Splash Screen
      home: const SplashScreen(),
    );
  }
}
