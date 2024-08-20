import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Fetch products by category
  Future<List<dynamic>> fetchProductsByCategory(String category) async {
    // Use a sample API endpoint for demonstration. Replace with actual endpoint.
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Fetch all products (useful for home screen)
  Future<List<dynamic>> fetchAllProducts() async {
    // Use a sample API endpoint for demonstration. Replace with actual endpoint.
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
