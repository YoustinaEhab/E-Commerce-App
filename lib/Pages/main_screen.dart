import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/Pages/HomePage/home_screen.dart';
import 'package:ecommerce_app/Pages/about_us_screen.dart';
import 'package:ecommerce_app/Data/category.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:ecommerce_app/Pages/cart_screen.dart';
import 'package:ecommerce_app/Pages/favorites_screen.dart';
import 'package:ecommerce_app/Data/dbhelper.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  List<Item> _bestSellers = [];
  List<Category> _categories = [];
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _initHomeData();
  }

  void _initHomeData() async {
    _categories = await DatabaseHelper.getAllCategories();
    _bestSellers = await DatabaseHelper.getBestSellers();
    setState(() {});
  }

  void _selectedPage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screens = [
      HomePage(_categories, _bestSellers),
      Favorites(),
      const Cart(),
      const AboutUs(),
    ];

    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurpleAccent,
        height: 60,
        buttonBackgroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        index: _index,
        onTap: _selectedPage,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.info, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
