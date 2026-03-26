import 'package:flutter/foundation.dart';
import 'package:luxeflow_ecommerce/core/api/api_client.dart';
import 'package:luxeflow_ecommerce/features/product/data/models/product.dart';

class ProductRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _apiClient.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      debugPrint('Error fetching products: $e');
      return [];
    }
  }
}
