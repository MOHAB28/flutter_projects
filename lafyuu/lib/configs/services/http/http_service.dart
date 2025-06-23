import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lafyuu/core/api/api.dart';

import 'http_service_impl.dart';

class AuthServiceImpl implements AuthService {
  // Create a singleton instance of AuthServiceImpl

  // First create a private constructor
  AuthServiceImpl._internal();

  // Then create a static instance of the class
  static final AuthServiceImpl _instance = AuthServiceImpl._internal();

  // Use a factory constructor to return the static instance
  // This allows you to use AuthServiceImpl() to get the same instance every time
  factory AuthServiceImpl() {
    return _instance;
  }

  final _storage = const FlutterSecureStorage();

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse('${Api.baseUrl}${Api.login}');
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

    final url = Uri.parse('${Api.baseUrl}${Api.refreshToken}');
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
    var url = Uri.parse('${Api.baseUrl}$endpoint');

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
