class Product {
  final String? name;
  final String? image;
  final String? color;
  final String? size;
  final int? price;
  int? quantity;

  Product(
      {required this.color,
      required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      this.size});
}
