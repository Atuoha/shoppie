class Product {
  final String id;
  final List<String> categories;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final double previousPrice;
  final String colors;

  const Product(
   this.id,
   this.categories,
   this.name,
   this.imageUrl,
   this.description,
   this.price,
   this.previousPrice,
   this.colors,
  );
}
