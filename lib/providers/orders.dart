import 'package:flutter/material.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final double totalAmount;
  final List<CartItem> products;
  final DateTime orderDate;

  OrderItem({
    required this.id,
    required this.products,
    required this.totalAmount,
    required this.orderDate,
  });
}

class Orders extends ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(double totalAmount, List<CartItem> products) {
    var newOrder = OrderItem(
      id: DateTime.now().toString(),
      products: products,
      totalAmount: totalAmount,
      orderDate: DateTime.now(),
    );
    // _orders.add(newOrder);  // will be added to the end of the list
    _orders.insert(0, newOrder); // will be added as the first item.
    notifyListeners();
  }

  double get getTotal {
    var total = 0.0;
    for (var order in _orders) {
      total += order.totalAmount;
    }
    return total;
  }

  void removeOrder(id) {
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }

  void clearOrder() {
    _orders.clear();
    notifyListeners();
  }
}
