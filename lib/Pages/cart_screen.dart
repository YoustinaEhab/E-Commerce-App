import 'package:ecommerce_app/Providers/cart_provider.dart';
import 'package:ecommerce_app/Modules/item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ItemPage/item_screen.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Cart',style: TextStyle(color: Colors.deepPurple)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            color: Colors.deepPurple,
            onPressed: () {
              cartProvider.clearCart();
            },
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/Login'),
          icon: const Icon(Icons.logout),
          color: Colors.deepPurple,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.CartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final product = cartProvider.CartItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ItemPage(item: product);
                      }),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children:[ ItemListView(item: product), ]
                    ),
                  )
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'EGP ${cartProvider.getTotalPrice().toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            child: ElevatedButton(
              onPressed: () {
                if(cartProvider.CartItems.isEmpty){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                            'Sorry, your cart is empty.',style: TextStyle(color: Colors.deepPurple,fontSize: 20)),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                          'Your order has been confirmed.',style: TextStyle(color: Colors.deepPurple,fontSize: 20)),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent),
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
