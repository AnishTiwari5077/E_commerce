class Product {
  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;
}

final List<Product> products = [
  const Product(
    category: 'footwear',
    description: 'This is a description of the product 1',
    imageUrl: 'assets/images/shoe.jpg',
    name: 'shoes',
    oldPrice: 189,
    price: 69,
  ),
  Product(
    category: 'Electronics',
    description: 'This is a description of the product 2',
    imageUrl: 'assets/images/laptop.jpg',
    name: 'laptop',
    isFavorite: true,
    oldPrice: 189,
    price: 69,
  ),
  Product(
    category: 'footwear',
    description: 'This is a description of the product 3',
    imageUrl: 'assets/images/shoe2.jpg',
    name: 'jordon shoes',
    oldPrice: 189,
    isFavorite: true,
    price: 69,
  ),
  Product(
    category: 'footwear',
    description: 'This is a description of the product 4',
    imageUrl: 'assets/images/shoe2.jpg',
    name: 'puma',
    oldPrice: 189,
    price: 69,
  ),
];
