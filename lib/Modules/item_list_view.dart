import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/cart_provider.dart';
import '../Data/item.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        Container(
        height: 90,
        padding: EdgeInsets.all(8.0),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(item.image),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        'EGP. ${item.price}',
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.0,
                        ),
                      ),
                    ]
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.deepPurple, size: 20),
                    onPressed: () {
                      cartProvider.removeFromCart(item);
                    },
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add,
                              color: Colors.deepPurple, size: 15),
                          onPressed: (){
                            cartProvider.addCounter();
                          },
                        ),
                        Text(
                          cartProvider.getCounter().toString(),
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove,
                              color: Colors.deepPurple, size: 15),
                          onPressed: () {
                            cartProvider.removeCounter();
                          },
                        ),
                      ],),
                  ),
                ],
              ),
            ],
          ),
      ),
      ]
    );
  }

}