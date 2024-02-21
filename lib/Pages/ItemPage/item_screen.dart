import 'package:ecommerce_app/Pages/ItemPage/widgets/item_details.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/favorites_provider.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {

    // Access the FavoritesProvider
    var favoritesProvider = Provider.of<FavoritesProvider>(context);

    // Check if the item is in favorites
    bool isFavorite = favoritesProvider.isFavorite(item);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          item.name,
          style: const TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.deepPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.deepPurple,
            ),
            iconSize: 20,
            onPressed: () {
              if (isFavorite) {
                favoritesProvider.removeFromFavorites(item);
              } else {
                favoritesProvider.addToFavorites(item);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ItemDetails(item: item),

      ),
    );
  }
}
