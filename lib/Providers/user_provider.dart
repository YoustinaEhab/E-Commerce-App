import 'package:ecommerce_app/Data/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  late int _id;
  late User _currentUser;

  void setUser(int id, User currentUser) {
    _id = id;
    _currentUser = currentUser;
    notifyListeners();
  }

  int getId() => _id;
  User getUser() => _currentUser;
}
