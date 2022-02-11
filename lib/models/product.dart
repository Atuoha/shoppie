import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final double previousPrice;
  final String colors;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.previousPrice,
    required this.price,
    required this.colors,
    this.isFavorite = false,
  });



  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }


}
