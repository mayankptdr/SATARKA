import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  // Chrome/Web
  static const String baseUrl = "https://satarka-backend.onrender.com";
  // Android Emulator
  // static const String baseUrl = "http://10.0.2.2:8000";

  // ---------------- AI CHAT ----------------

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"message": message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data["response"];
    }

    throw Exception("Failed to contact SATARKA AI");
  }

  // ---------------- REPORT ANALYZER ----------------

  static Future<String> analyzeReport(File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/analyze-report"),
    );

    request.files.add(await http.MultipartFile.fromPath("file", file.path));

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data.containsKey("analysis")) {
        return data["analysis"];
      }

      if (data.containsKey("error")) {
        throw Exception(data["error"]);
      }
    }

    throw Exception("Failed to analyze report.");
  }
}
