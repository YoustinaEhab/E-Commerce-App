import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/favorites_provider.dart';
import '../Data/item.dart';
import '../Modules/item_grid_view.dart';
import 'ItemPage/item_screen.dart';

class Favorites extends StatefulWidget {

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Item> favorites = [];
  @override
  Widget build(BuildContext context) {

    var favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Favorites", style: TextStyle(color: Colors.deepPurple),)),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/Login'),
          icon: const Icon(Icons.logout),
          color: Colors.deepPurple,
        ),
      ),
       body: GridView.builder(
         padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           crossAxisSpacing: 20.0,
           mainAxisSpacing: 15.0,
           // itemWidth / itemHeight
           childAspectRatio: 0.82,
         ),
        itemCount: favoritesProvider.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          final product = favoritesProvider.favorites[index];
          return GestureDetector(
              onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ItemPage(item: product);
              }),
            );
          },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: SizedBox(
                height: 30,
                width: 30,
                child: ItemGridView(item: product),
              ),
            ),
          );
        },
       ),
    );
  }
}

