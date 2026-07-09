import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EmergencyContactService {
  static const String key = "emergency_contacts";

  static Future<List<Map<String, String>>> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(key);

    if (data == null) return [];

    final List decoded = jsonDecode(data);

    return decoded
        .map<Map<String, String>>(
          (e) => {"name": e["name"].toString(), "phone": e["phone"].toString()},
        )
        .toList();
  }

  static Future<void> saveContacts(List<Map<String, String>> contacts) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, jsonEncode(contacts));
  }
}
