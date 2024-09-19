import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  // ----GetStorage----
  final box = GetStorage();
  getToken() {
    box.read('token');
  }

  saveToken(String token) {
    box.write('token', token);
  }

  clearToken() {
    box.remove('token');
  }

  // ----SharedPreferences----
  static Future<String> getToken1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String getToken = prefs.getString('token') ?? "";
    return getToken;
  }

  static saveToken1(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static clearToken1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }
}
