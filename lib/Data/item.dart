class Item {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;
  final int soldAmount;
  final String categoryName;

  const Item({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.soldAmount,
    required this.categoryName,
  });

  Item.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        description = json['description'],
        soldAmount = json['soldAmount'],
        categoryName = json['category'];

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'soldAmount': soldAmount,
      'category': categoryName,
    };
  }

  List<dynamic> toList() =>
      [id, name, image, price, description, soldAmount, categoryName];
}
