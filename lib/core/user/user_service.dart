import 'package:shared_preferences/shared_preferences.dart';

import 'user_profile.dart';

class UserService {
  static Future<void> saveUser({
    required String name,
    required int age,
    required String gender,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", name);
    await prefs.setInt("age", age);
    await prefs.setString("gender", gender);

    UserProfile.name = name;
    UserProfile.age = age;
    UserProfile.gender = gender;
  }

  static Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    UserProfile.name = prefs.getString("name") ?? "Guest";
    UserProfile.age = prefs.getInt("age") ?? 0;
    UserProfile.gender = prefs.getString("gender") ?? "";
  }
}
