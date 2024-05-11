import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  FavoritesService._internal(); // Private constructor to prevent external instantiation

  static final FavoritesService _instance = FavoritesService._internal();

  static const String FAVORITES_KEY = 'favorites';

  static List<String> _favorites = [];

  factory FavoritesService() {
    _instance._init();
    return _instance; // Return the existing instance
  }

  Future<void> _init() async {
    await _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList(FAVORITES_KEY) ?? [];
  }

  Future<void> _saveFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(FAVORITES_KEY, _favorites);
  }

  Future<void> addFavorite(String postId) async {
    if (_favorites.contains(postId)) return;
    _favorites.add(postId);
    await _saveFavorites();
  }

  Future<void> removeFavorite(String postId) async {
    if (!_favorites.contains(postId)) return;
    _favorites.remove(postId);
    await _saveFavorites();
  }

  bool containsFavorite(String postId) {
    return _favorites.contains(postId);
  }

  void toggleFavorite(String postId) {
    if (containsFavorite(postId)) {
      removeFavorite(postId);
    } else {
      addFavorite(postId);
    }
  }
}
