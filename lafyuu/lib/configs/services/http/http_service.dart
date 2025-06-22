import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'http_service_impl.dart';

class AuthServiceImpl implements AuthService {
  final _baseUrl = 'https://dummyjson.com';
  final _storage = const FlutterSecureStorage();

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveTokens(
        accessToken: data['token'],
        refreshToken: data['refreshToken'],
      );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: 'accessToken', value: accessToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  @override
  Future<bool> refreshAccessToken() async {
    final refreshToken = await getRefreshToken();

    if (refreshToken == null) return false;

    final url = Uri.parse('$_baseUrl/auth/refresh');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken, 'expiresInMins': 30}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveTokens(
        accessToken: data['token'],
        refreshToken: data['refreshToken'] ?? refreshToken,
      );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<http.Response> authenticatedGet(String endpoint) async {
    String? accessToken = await getAccessToken();
    var url = Uri.parse('$_baseUrl$endpoint');

    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 401) {
      bool refreshed = await refreshAccessToken();
      if (refreshed) {
        accessToken = await getAccessToken();
        response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        );
      }
    }

    return response;
  }
}
