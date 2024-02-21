
class Category {
  final String categoryImage;
  final String categoryName;
  //final List<Item> categoryItems;

  Category(this.categoryImage, this.categoryName);

  Category.fromJson(Map<String, dynamic> json)
      : categoryImage = json['image'],
        categoryName = json['name'];
}
