import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:luxeflow_ecommerce/core/api/api_client.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiClient.post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final token = response.data['token'];
        await _storage.write(key: 'jwt_token', value: token);
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Login Exception: ${e.response?.data}');
      return false;
    } catch (e) {
      print('Generic Login Error: $e');
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final response = await _apiClient.post('/auth/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        final token = response.data['token'];
        await _storage.write(key: 'jwt_token', value: token);
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Register Exception: ${e.response?.data}');
      return false;
    } catch (e) {
      print('Generic Register Error: $e');
      return false;
    }
  }

  Future<bool> logout() async {
    await _storage.delete(key: 'jwt_token');
    return true;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'jwt_token');
    return token != null;
  }
}
