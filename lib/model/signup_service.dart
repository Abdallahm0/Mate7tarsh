// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SignupService {
//   static const String _baseUrl = "https://yourapiurl.com"; // Replace with your API base URL

//   static Future<Map<String, dynamic>> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     final url = Uri.parse("$_baseUrl/signup"); // Replace `signup` with your endpoint

//     final response = await http.post(
//       url,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "name": name,
//         "email": email,
//         "password": password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Failed to sign up: ${response.body}");
//     }
//   }
// }
