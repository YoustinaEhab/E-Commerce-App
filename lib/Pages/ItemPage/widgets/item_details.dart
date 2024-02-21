import 'package:ecommerce_app/Data/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Providers/cart_provider.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<CartProvider>(context);

    bool isAdded = cartProvider.isAdded(item);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(item.image, height: 200, width: 200),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'EGP. ${item.price}',
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
              const Text(
                'Details:',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (isAdded) {
                          cartProvider.removeFromCart(item);
                        } else {
                          cartProvider.addToCart(item);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: isAdded? const Text('Added to Cart'): const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
