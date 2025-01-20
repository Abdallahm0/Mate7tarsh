import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://your-api-endpoint.com'; // Replace with your API URL

  // Method to send user data to the API
  static Future<void> completeProfile({
    required int age,
    required String favoritePlaces,
    required String favoriteFood,
    required String diseases,
  }) async {
    final url = Uri.parse('$_baseUrl/complete-profile'); // Replace with your API endpoint
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'age': age,
        'favorite_places': favoritePlaces,
        'favorite_food': favoriteFood,
        'diseases': diseases,
      }),
    );

    if (response.statusCode == 200) {
      // Success
      print('Profile completed successfully');
    } else {
      // Error
      throw Exception('Failed to complete profile');
    }
  }
}