import 'package:flutter/foundation.dart';

class CartItem {
  final String productId;
  final String id;
  final String name;
  final double price;
  final double previousPrice;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.productId,
    required this.id,
    required this.name,
    required this.price,
    required this.previousPrice,
    required this.quantity,
    required this.imageUrl,
  });
}

class Cart extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void toggleQuantity(String id, String operation) {
    switch (operation) {
      case 'increment':
        if (_items.containsKey(id)) {
          _items.update(
            id,
            (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              previousPrice: existingCartItem.previousPrice,
              imageUrl: existingCartItem.imageUrl,
              quantity: existingCartItem.quantity + 1,
            ),
          );
        }
        break;
      case 'decrement':
        if (_items.containsKey(id)) {
          _items.update(
            id,
            (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              previousPrice: existingCartItem.previousPrice,
              imageUrl: existingCartItem.imageUrl,
              quantity: existingCartItem.quantity - 1,
            ),
          );

        }
        break;
      default:
    }
    notifyListeners();
  }

  void removeFromCart(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void addItemToCart(String productID, String name, double price,
      double previousPrice, String imageUrl) {
    if (_items.containsKey(productID)) {
      // increase quantity
      
      // Am checking using isItemOnCart to know if a user click on a already added to cart item. This operation can only be performed if the user want the item to be removed from the cart so if it is so, the item will be removed from the cart 
      isItemOnCart(productID) ?
        _items.remove(productID) :
      _items.update(
        productID,
        (existingCartItem) => CartItem(
          productId: existingCartItem.productId,
          id: existingCartItem.id,
          name: existingCartItem.name,
          price: existingCartItem.price,
          previousPrice: existingCartItem.previousPrice,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // add product
      _items.putIfAbsent(
        productID,
        () => CartItem(
          productId: productID,
          id: DateTime.now().toString(),
          name: name,
          price: price,
          previousPrice: previousPrice,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  bool isItemOnCart(String productId) {
    return _items.containsKey(productId);
  }

}
