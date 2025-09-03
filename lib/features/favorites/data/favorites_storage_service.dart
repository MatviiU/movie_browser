import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStorageService {
  static const String _key = 'favoriteMovieIds';

  Future<void> saveFavorites(List<int> movieIds) async {
    final prefs = await SharedPreferences.getInstance();
    final stringIds = movieIds.map((id) => id.toString()).toList();
    await prefs.setStringList(_key, stringIds);
  }

  Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringIds = prefs.getStringList(_key);
    if (stringIds == null) {
      return [];
    }
    return stringIds.map(int.parse).toList();
  }
}
