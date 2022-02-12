import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/components/cart_down_summary.dart';
import 'package:shoppie/components/single_cart_item.dart';
import 'package:shoppie/providers/cart.dart' show Cart;

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cartPage';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    return cartData.items.isEmpty
        ? const Center(
            child: Text('Opps! No Item on Cart'),
          )
        : Column(
            children: [
              Expanded(
                flex: 5,
                child: Consumer<Cart>(
                  builder: (_, cart, _2) => ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return SingleCartItem(
                        id: cart.items.values.toList()[index].productId,
                        name: cart.items.values.toList()[index].name,
                        image: cart.items.values.toList()[index].imageUrl,
                        price: cart.items.values.toList()[index].price,
                        previousPrice:
                            cart.items.values.toList()[index].previousPrice,
                        quantity: cart.items.values.toList()[index].quantity,
                      );
                    },
                  ),
                ),
              ),
              Consumer<Cart>(
                builder: (_, cart, _2) => CartDownSummary(
                  cart.totalAmount, cart.items.values.toList()
                ),
              )
            ],
          );
  }
}
