import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppie/components/single_cart_item.dart';
import 'package:shoppie/models/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cartPage';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(
      () {
        Timer.periodic(
            const Duration(milliseconds: 1), (Timer timer) => totalPrice);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? const Center(
            child: Text('Opps! No Item on Cart'),
          )
        : Column(children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return SingleCartItem(
                    cartItems[index].name,
                    cartItems[index].imageUrl,
                    cartItems[index].price,
                    cartItems[index].previousPrice,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('BUy Now'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]);
  }
}
