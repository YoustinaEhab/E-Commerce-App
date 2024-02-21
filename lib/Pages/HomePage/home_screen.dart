import 'package:ecommerce_app/Pages/HomePage/widgets/advertisements.dart';
import 'package:ecommerce_app/Modules/items_group_view.dart';
import 'package:ecommerce_app/Pages/category_screen.dart';
import 'package:ecommerce_app/Modules/search_bar.dart';
import 'package:ecommerce_app/Data/category.dart';
import 'package:ecommerce_app/Data/item.dart';
import 'package:ecommerce_app/Data/dbhelper.dart';
import 'package:flutter/material.dart';

import '../../Data/initial_data.dart';

class HomePage extends StatefulWidget {
  final String _title = 'E-commerce';
  final List<Item> _bestSellers;
  final List<Category> _allCategories;

  const HomePage(this._allCategories, this._bestSellers, {super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
  @override
  class _HomePageState extends State<HomePage> {

    List<Item> filteredItems = [];

    List<Item> initialItems = InitialData.initialItems;

    bool isSearching = false;

    void filterItems(String query) {
      setState(() {
        if (query.isNotEmpty) {
          filteredItems = initialItems
              .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          isSearching = true;
        } else {
          filteredItems = List.from(initialItems);
          isSearching = false;
        }
      });
    }

  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        //backgroundColor: Color(0xFFFFFFFFD0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/Login'),
            icon: const Icon(Icons.logout),
            color: Colors.deepPurple,
          ),
          centerTitle: true,
          title: Text(
            widget._title,
            style: const TextStyle(color: Colors.deepPurple),
          ),
          // automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: Colors.deepPurple),
              onPressed: () => Navigator.pushNamed(context, '/Profile'),
            ),
          ],
        ),
        body: Container(
                padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                      children: [
                        SearchBar(onSearch: filterItems),
                       Expanded(
                           child:
                            isSearching
                                ? (filteredItems.isNotEmpty
                                ? ItemsGroupView(items: filteredItems)
                                : Center(child: Text('Item not found',style: TextStyle(color: Colors.deepPurple,fontSize: 18, fontWeight: FontWeight.bold),)))
                              : Column(
                            children: [
                              advertisements(),
                              //SizedBox(height: 2),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                child: const Text(
                                  'Categories',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                child: ListView(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (int i = 0; i < widget._allCategories.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(right: 6.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.deepPurpleAccent,
                                            elevation: 4,
                                            shape:RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              side: BorderSide(color: Colors.deepPurpleAccent), // Add a border side
                                            ),
                                            //shadowColor: Colors.deepPurpleAccent.withOpacity(0.4), // Add a shadow color
                                            //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  widget._allCategories[i].categoryImage,
                                                  //categoriesProvider.category(i).categoryImage,
                                                  width: 34,
                                                  height: 35,
                                                  alignment: Alignment.centerRight),
                                              Text(
                                                widget._allCategories[i].categoryName,
                                                //categoriesProvider.category(i).categoryName,
                                                textAlign: TextAlign.center,
                                                style:
                                                const TextStyle(color: Colors.deepPurple),
                                              ),
                                            ],
                                          ),
                                          onPressed: () async {
                                            List<Item> _categoryItems =
                                            await DatabaseHelper.getCategoryItems(
                                                widget._allCategories[i].categoryName);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return CategoryPage(
                                                  categoryName: widget._allCategories[i].categoryName,
                                                  categoryItems: _categoryItems,
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              //const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                child: const Text(
                                  'Best Sellers',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(child: ItemsGroupView(items: widget._bestSellers)),
                            ],
                          )
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}