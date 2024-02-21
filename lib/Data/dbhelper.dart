import 'dart:async';

import 'package:ecommerce_app/Data/initial_data.dart';
import 'package:ecommerce_app/Data/category.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:ecommerce_app/Data/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Initialize Database Object
  static Database? _db;

  static const String usersTable = 'Users';
  static const String userId = 'id';
  static const String userUsername = 'name';
  static const String userEmail = 'email';
  static const String userPassword = 'password';

  static const String categoriesTable = 'Categories';
  static const String categoryId = 'id';
  static const String categoryImage = 'image';
  static const String categoryName = 'name';

  static const String itemsTable = 'Items';
  static const String itemId = 'id';
  static const String itemName = 'name';
  static const String itemImage = 'image';
  static const String itemPrice = 'price';
  static const String itemDescription = 'description';
  static const String itemSoldAmount = 'soldAmount';
  static const String itemCategory = 'category';

  static const String favouritesTable = 'Favourites';
  static const String favouriteOwner = 'userId';
  static const String favouriteItem = 'itemId';

  static const String cartTable = 'Cart';
  static const String cartOwner = 'userId';
  static const String cartItem = 'itemId';

  // Make Init function that will be used to identify the database object
  static Future<void> initDB() async {
    print('initDB');
    String databasesPath = await getDatabasesPath();
    String path = ('${databasesPath}EcommerceDB.db');
    _db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('Database Opened !!');
      },
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $usersTable ($userId INTEGER PRIMARY KEY AUTOINCREMENT, $userUsername TEXT NOT NULL, $userEmail TEXT UNIQUE NOT NULL, $userPassword TEXT NOT NULL)');
        await db.execute(
            'CREATE TABLE $categoriesTable ($categoryId INTEGER PRIMARY KEY AUTOINCREMENT, $categoryImage TEXT NOT NULL, $categoryName TEXT UNIQUE NOT NULL)');
        await db.execute(
            'CREATE TABLE $itemsTable ($itemId INTEGER PRIMARY KEY AUTOINCREMENT, $itemName TEXT UNIQUE NOT NULL,  $itemImage TEXT NOT NULL, $itemPrice REAL NOT NULL, $itemDescription TEXT NOT NULL, $itemSoldAmount INTEGER NOT NULL, $itemCategory REFERENCES $categoriesTable($categoryName))');
        await db.execute(
            'CREATE TABLE $favouritesTable ($favouriteOwner REFERENCES $usersTable($userId), $favouriteItem REFERENCES $itemsTable($itemId))');
        await db.execute(
            'CREATE TABLE $cartTable ($cartOwner REFERENCES $usersTable($userId), $cartItem REFERENCES $itemsTable($itemId))');
        print('Database Created!!');
      },
    );
  }

  static Future<int> initCategories() async {
    int result;
    var failsCount = 0;
    print('Initialize Categories!');
    for (int i = 0; i < InitialCategories.values.length; ++i) {
      try {
        result = await _db!.rawInsert(
            'INSERT INTO $categoriesTable($categoryImage, $categoryName) VALUES(?,?)',
            [
              'assets/categories/category$i.png',
              InitialCategories.values[i].name
            ]);
      } catch (e) {
        failsCount--;
      }
    }
    return failsCount;
  }

  static Future<int> initItems() async {
    int result;
    var failsCount = 0;
    print('Initialize Items!');
    for (int i = 0; i < InitialData.initialItems.length; ++i) {
      try {
        result = await _db!.rawInsert(
            'INSERT INTO $itemsTable($itemName, $itemImage, $itemPrice, $itemDescription, $itemSoldAmount, $itemCategory) VALUES(?,?,?,?,?,?)',
            InitialData.initialItems[i].toList());
      } catch (e) {
        failsCount--;
      }
    }
    return failsCount;
  }

  static Future<int> addUser(User user) async {
    int result;
    try {
      result = await _db!.rawInsert(
          'INSERT INTO $usersTable ($userUsername, $userEmail, $userPassword) VALUES (?,?,?)',
          [user.username, user.email, user.password]);
      print('Adding New User');
      print(result);
    } catch (e) {
      return -1;
    }
    return result;
  }

  static Future<bool> isUserPresent(String email, String password) async {
    var result = await _db!.query(usersTable,
        where: '$userEmail = ? AND $userPassword = ?',
        whereArgs: [email, password]);
    print('Check User!');
    print(result);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getUserInfo(String email) async {
    var result = await _db!
        .query(usersTable, where: '$userEmail = ?', whereArgs: [email]);
    print('Get User Info!');
    print(result);
    return result[0];
  }

  static Future<int> updateUserInfo(User user, int id) async {
    var result = await _db!.update(usersTable, user.toJson(),
        where: '$userId = ?', whereArgs: [id]);
    print('Update User!');
    print(result);
    return result;
  }

  static Future<List<Category>> getAllCategories() async {
    var result = await _db!.query(categoriesTable);
    List<Category> allCategories = [];
    Category newCategory;
    print('Get All Categories!');
    for (var category in result) {
      newCategory = Category.fromJson(category);
      allCategories.add(newCategory);
    }
    return allCategories;
  }

  static Future<List<Item>> getCategoryItems(String categoryName) async {
    List<Item> categoryItems = [];
    var result = await _db!.query(itemsTable,
        where: '$itemCategory = ?', whereArgs: [categoryName]);
    print('Get Category Items!');
    if (result.isNotEmpty) {
      Item newItem;
      for (var item in result) {
        newItem = Item.fromJson(item);
        categoryItems.add(newItem);
      }
      return categoryItems;
    } else {
      return [];
    }
  }

  static Future<List<Item>> getBestSellers() async {
    var result =
        await _db!.query(itemsTable, orderBy: '$itemSoldAmount DESC', limit: 6);
    List<Item> bestSellers = [];
    Item newItem;
    print('Get Best Sellers!');
    for (var item in result) {
      newItem = Item.fromJson(item);
      bestSellers.add(newItem);
    }
    return bestSellers;
  }

  static Future<int> addFavorite(int userId, int itemId) async {
    int result;
    try {
      result = await _db!.rawInsert(
          'INSERT INTO $favouritesTable($favouriteOwner, $favouriteItem) VALUES (?, ?)',
          [userId, itemId]);
    } catch (e) {
      return -1;
    }
    return result;
  }

  static Future<int> removeFavorite(int userId, int itemId) async {
    int result;
    try {
      result = await _db!.rawDelete(
          'DELETE FROM $favouritesTable WHERE $favouriteOwner = ? AND $favouriteItem = ?',
          [userId, itemId]);
    } catch (e) {
      return -1;
    }
    return result;
  }

  static Future<List<Item>> getFavorites(int userId) async {
    var result = await _db!.rawQuery('''
    SELECT $itemsTable.*
    FROM $itemsTable
    JOIN $favouritesTable ON $favouritesTable.$favouriteItem = $itemsTable.$itemId
    WHERE $favouritesTable.$favouriteOwner = ?
  ''', [userId]);
    List<Item> favoriteItems = [];
    Item newItem;
    for (var item in result) {
      newItem = Item.fromJson(item);
      favoriteItems.add(newItem);
    }
    return favoriteItems;
  }

  static Future<int> addToCart(int userId, int itemId) async {
    int result;
    try {
      result = await _db!.rawInsert(
          'INSERT INTO $cartTable($cartOwner, $cartItem) VALUES (?, ?)',
          [userId, itemId]);
    } catch (e) {
      return -1;
    }
    return result;
  }

  static Future<int> removeFromCart(int userId, int itemId) async {
    int result;
    try {
      result = await _db!.rawDelete(
          'DELETE FROM $cartTable WHERE $cartOwner = ? AND $cartItem = ?',
          [userId, itemId]);
    } catch (e) {
      return -1;
    }
    return result;
  }

  static Future<List<Item>> getCartItems(int userId) async {
    var result = await _db!.rawQuery('''
    SELECT $itemsTable.*
    FROM $itemsTable
    JOIN $cartTable ON $cartTable.$cartItem = $itemsTable.$itemId
    WHERE $cartTable.$cartOwner = ?
  ''', [userId]);
    List<Item> CartItems = [];
    Item newItem;
    for (var item in result) {
      newItem = Item.fromJson(item);
      CartItems.add(newItem);
    }
    return CartItems;
  }

}
