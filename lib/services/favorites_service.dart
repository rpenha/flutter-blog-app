import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  FavoritesService._internal(); // Private constructor to prevent external instantiation

  static final FavoritesService _instance = FavoritesService._internal();

  static const String FAVORITES_KEY = 'favorites';

  factory FavoritesService() {
    return _instance; // Return the existing instance
  }

  Future<List<String>> _getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList(FAVORITES_KEY);
    if (favorites == null) {
      favorites = [];
      await _saveFavorites(favorites);
    }
    return favorites;
  }

  Future<void> _saveFavorites(List<String>? favorites) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(FAVORITES_KEY, favorites!);
  }

  Future<void> addFavorite(String postId) async {
    var favorites = await _getFavorites();
    if (favorites.contains(postId)) return;
    favorites.add(postId);
    await _saveFavorites(favorites);
  }

  Future<void> removeFavorite(String postId) async {
    List<String> favorites = await _getFavorites();
    if (!favorites.contains(postId)) return;
    favorites.remove(postId);
    await _saveFavorites(favorites);
  }

  Future<bool> containsFavorite(String postId) async {
    var favorites = await _getFavorites();
    return favorites.contains(postId);
  }

  Future<void> toggleFavorite(String postId) async {
    if (await containsFavorite(postId)) {
      removeFavorite(postId);
    } else {
      addFavorite(postId);
    }
  }
}
