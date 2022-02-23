import 'package:flutter/material.dart';
import 'package:shoppie/providers/orders.dart';

class OrderDownSummary extends StatelessWidget {
  final double totalAmount;
  final List<OrderItem> cartItems;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  OrderDownSummary(this.totalAmount,this.cartItems);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    '\$${totalAmount.toStringAsFixed(2)}',
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
              onPressed: () => {
                if(totalAmount > 0){
               
                }
                },
              child: const Text('Buy Now'),
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
    );
  }
}
