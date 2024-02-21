import 'package:ecommerce_app/Modules/items_group_view.dart';
import 'package:ecommerce_app/Modules/search_bar.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:flutter/material.dart';

import '../Data/initial_data.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryItems,
  });

  final String categoryName;
  final List<Item> categoryItems;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Item> filteredItems = [];
  List<Item> initialItems = InitialData.initialItems;
  bool isSearching = false;
  void filterItems(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredItems = initialItems
            .where((item) =>
        item.categoryName == widget.categoryName &&
            item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        isSearching = true;
      } else {
        filteredItems = initialItems
            .where((item) => item.categoryName == widget.categoryName)
            .toList();
        isSearching = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xFFFFFFFFD0),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.deepPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchBar(onSearch: filterItems),
            // HERE
            Expanded(
              child: isSearching
                  ? (filteredItems.isNotEmpty
                  ? ItemsGroupView(items: filteredItems)
                  : Center(child: Text('Item not found',style: TextStyle(color: Colors.deepPurple,fontSize: 18, fontWeight: FontWeight.bold),)))
                  : ItemsGroupView(items: widget.categoryItems),
            ),
          ],
        ),
      ),
    );
  }
}
