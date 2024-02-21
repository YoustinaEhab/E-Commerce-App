import 'package:ecommerce_app/Data/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/cart_provider.dart';
import '../Providers/favorites_provider.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {

    // Access the FavoritesProvider
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    // Check if the item is in favorites
    bool isFavorite =  favoritesProvider.isFavorite(item);

    // Access the CartProvider
    var cartProvider = Provider.of<CartProvider>(context);

    // Check if the item is in Cart
    bool isAdded = cartProvider.isAdded(item);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
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
        SizedBox(
          height: 55,
          width: 55,
          child: Image.asset(item.image),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: Colors.deepPurple,
              ),
            ),
            Row(
              children: [
                Text(
                  '  EGP. ${item.price}',
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.0,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    isAdded ? Icons.shopping_cart : Icons
                        .add_shopping_cart,
                    color: isAdded ? Colors.deepPurple : Colors
                        .deepPurple,
                  ),
                  iconSize: 20,
                  onPressed: () {
                    if (isAdded) {
                      cartProvider.removeFromCart(item);
                    } else {
                      cartProvider.addToCart(item);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
