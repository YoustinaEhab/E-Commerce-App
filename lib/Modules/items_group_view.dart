import 'package:ecommerce_app/Pages/ItemPage/item_screen.dart';
import 'package:ecommerce_app/Modules/item_grid_view.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:flutter/material.dart';

class ItemsGroupView extends StatelessWidget {
  const ItemsGroupView({super.key, required this.items});

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return items.length == 0
        ? const Center(
      child: CircularProgressIndicator(color: Colors.deepPurple),
    )
        :GridView.builder(
      shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 14, right: 15, top: 4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 15.0,
        // itemWidth / itemHeight
        childAspectRatio: 0.82,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final product = items[index];
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
            // child: SizedBox(
            //   height: 30,
            //   width: 30,
              child:
              ItemGridView(item: product),
            //),
          ),
        );
      },
    );
  }
}
