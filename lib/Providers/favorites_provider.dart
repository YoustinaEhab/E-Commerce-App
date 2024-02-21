import 'package:flutter/material.dart';
import '../Data/item.dart';
import '../Data/dbhelper.dart';

class FavoritesProvider with ChangeNotifier {
  late int _userId;
  List<Item> _favorites = [];

  int get userId => _userId; // Add a getter for userId

  List<Item> get favorites => _favorites;

  // Add this method to set the user ID and clear favorites
  Future<void> setUserId(int userId) async {
    _userId = userId;
   // _favorites.clear(); // Clear the favorites list for the new user
    await fetchFavorites(); // Fetch the favorites for the new user
  }

  Future<void> addToFavorites(Item item) async {
    int result = await DatabaseHelper.addFavorite(_userId, item.id);
    if (result != -1) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  Future<void> removeFromFavorites(Item item) async {
    int result = await DatabaseHelper.removeFavorite(_userId, item.id);
    if (result != -1) {
      _favorites.remove(item);
      notifyListeners();
    }
  }


  Future<void> fetchFavorites() async {
    List<Item> favorites = await DatabaseHelper.getFavorites(_userId);
    _favorites = favorites;
    notifyListeners();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }

}


// class FavoritesProvider with ChangeNotifier {
//   late int _userId;
//   List<Item> _favorites = [];
//
//   int get userId => _userId;
//
//   List<Item> get favorites => _favorites;
//
//   Future<void> setUserId(int userId) async {
//     _userId = userId;
//     await fetchFavoritesFromStorage();
//     await fetchFavorites();
//   }
//
//   Future<void> addToFavorites(Item item) async {
//     int result = await DatabaseHelper.addFavorite(_userId, item.id);
//     if (result != -1) {
//       _favorites.add(item);
//       saveFavoritesToStorage();
//       notifyListeners();
//     }
//   }
//
//   Future<void> removeFromFavorites(Item item) async {
//     int result = await DatabaseHelper.removeFavorite(_userId, item.id);
//     if (result != -1) {
//       _favorites.remove(item);
//       saveFavoritesToStorage();
//       notifyListeners();
//     }
//   }
//
//   Future<void> fetchFavorites() async {
//     List<Item> favorites = await DatabaseHelper.getFavorites(_userId);
//     _favorites = favorites;
//     notifyListeners();
//   }
//
//   Future<void> fetchFavoritesFromStorage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? favoriteIds = prefs.getStringList('favorites_$_userId');
//     if (favoriteIds != null) {
//       _favorites = await DatabaseHelper.getItemsByIds(favoriteIds);
//       notifyListeners();
//     }
//   }
//
//   Future<void> saveFavoritesToStorage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> favoriteIds = _favorites.map((item) => item.id.toString()).toList();
//     prefs.setStringList('favorites_$_userId', favoriteIds);
//   }
//
//   bool isFavorite(Item item) {
//     return _favorites.contains(item);
//   }
// }


// import 'package:flutter/foundation.dart';
//
// class FavoritesProvider extends ChangeNotifier {
//   List<Item> _userFavorites = [];
//
//   List<Item> get userFavorites => _userFavorites;
//
//   void addToFavorites(Item itemId) {
//     _userFavorites.add(itemId);
//     notifyListeners();
//   }
//
//   void removeFromFavorites(Item itemId) {
//     _userFavorites.remove(itemId);
//     notifyListeners();
//   }
//   bool isFavorite(Item item) {
//     return _favorites.contains(item);
//   }
// }
