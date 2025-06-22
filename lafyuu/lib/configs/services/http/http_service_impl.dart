import 'package:http/http.dart' as http;

abstract class AuthService {
  Future<bool> login({required String username, required String password});

  Future<void> logout();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> refreshAccessToken();

  Future<http.Response> authenticatedGet(String endpoint);
}
