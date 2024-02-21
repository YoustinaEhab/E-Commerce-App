import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/item.dart';
import '../Data/dbhelper.dart';

class CartProvider with ChangeNotifier {
  late int _userId;
  List<Item> _CartItems = [];
  int _counter = 1;
  double _totalPrice = 0.0;

  int get counter => _counter;

  double get totalPrice => _totalPrice;

  int get userId => _userId; // Add a getter for userId

  List<Item> get CartItems => _CartItems;



  // Add this method to set the user ID and clear favorites
  Future<void> setUserId(int userId) async {
    _userId = userId;
    //_CartItems.clear(); // Clear the favorites list for the new user
    await fetchCartItems(); // Fetch the favorites for the new user
  }

  Future<void> addToCart(Item item) async {
    int result = await DatabaseHelper.addToCart(_userId, item.id);
    if (result != -1) {
      _CartItems.add(item);
      addTotalPrice(item.price * getCounter());
      notifyListeners();
    }
  }

  Future<void> removeFromCart(Item item) async {
    int result = await DatabaseHelper.removeFromCart(_userId, item.id);
    if (result != -1) {
      _CartItems.remove(item);
      removeTotalPrice(item.price * getCounter());
      notifyListeners();
    }
  }


  Future<void> fetchCartItems() async {
    List<Item> CartItems = await DatabaseHelper.getCartItems(_userId);
    _CartItems = CartItems;
    notifyListeners();
  }

  bool isAdded(Item item) {
    return _CartItems.contains(item);
  }

  void _savePrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Quantity", _counter);
    prefs.setDouble("Total Price", _totalPrice);
    notifyListeners();
  }

  void _getPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt("Quantity") ?? 1;
    prefs.getDouble("Total Price") ?? 0.0;
    notifyListeners();
  }

  void addCounter(){
    _counter++;
    addTotalPrice(_CartItems.isNotEmpty ? _CartItems.first.price : 0.0);
    _savePrefs();
    notifyListeners();
  }

  void removeCounter(){
    if(_counter > 1){
    _counter--;
    removeTotalPrice(_CartItems.isNotEmpty ? _CartItems.first.price : 0.0);
    _savePrefs();
    notifyListeners();
  }
  }

  int getCounter(){
    _getPrefs();
    return _counter;
  }

  void addTotalPrice(double itemPrice){
    _totalPrice += itemPrice;
    _savePrefs();
    notifyListeners();
  }

  void removeTotalPrice(double itemPrice){
  _totalPrice -= itemPrice;
  _savePrefs();
  notifyListeners();
 }

  Future<void> clearCart() async {
    for (var item in _CartItems) {
      await DatabaseHelper.removeFromCart(_userId, item.id);
    }
    _CartItems.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }


  double getTotalPrice(){
    _getPrefs();
    return _totalPrice;
  }

}