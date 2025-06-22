class Api {
  static const String baseUrl = 'https://dummyjson.com/';

  // Auth
  static const String login = 'auth/login';
  static const String refreshToken = 'auth/refresh';
  static const String getCurrentUser = 'auth/me';

  // Products
  static const String getProducts = 'products';
  static const String searchProducts = 'products/search';

  // Categories
  static const String getCategories = 'categories';
}
