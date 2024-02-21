import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterItems(String query) {
    widget.onSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 40,
      child: TextField(
        controller: searchController,
        onChanged: filterItems,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          contentPadding: EdgeInsets.all(5.0),
          filled: true,
          fillColor: Colors.white,
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(
            color: Colors.deepPurple,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}