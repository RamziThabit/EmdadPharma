class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String? description;
  final int categoryId;
  final double rating;
  final bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.description,
    required this.categoryId,
    required this.rating,
    required this.isAvailable,
  });
}
