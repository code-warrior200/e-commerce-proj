import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get userId => _userId;

  // Example login method
  Future<void> login(String email, String password) async {
    const String apiUrl = 'https://api.example.com/login'; // Replace with your login API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        _userId = data['userId'];
        _isAuthenticated = true;
        notifyListeners(); // Notify listeners to rebuild UI
      } else {
        _isAuthenticated = false;
        throw Exception('Failed to login');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
      _isAuthenticated = false;
      notifyListeners();
    }
  }

  // Example logout method
  void logout() {
    _token = null;
    _userId = null;
    _isAuthenticated = false;
    notifyListeners(); // Notify listeners to rebuild UI
  }

  // Example method to check if the user is authenticated
  bool checkAuthentication() {
    return _isAuthenticated;
  }

  register(String name, String email, String password) {}
}
