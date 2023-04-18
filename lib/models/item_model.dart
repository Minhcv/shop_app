class Item {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isLike;

  Item(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.isLike});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isLike: false,
    );
  }
}
