// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/cart.dart';
import 'package:shoppie/screens/product_detail.dart';

enum Operation { increment, decrement }
enum RemoveCartOperation { yes, no }

class SingleCartItem extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final double price;
  final double previousPrice;
  final int quantity;

  // ignore: use_key_in_widget_constructors
  SingleCartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.previousPrice,
    required this.quantity,
    required this.id,
  });

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  Widget textAction(String text, RemoveCartOperation operation) {
    return TextButton(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      onPressed: () {
        switch (operation) {
          case RemoveCartOperation.no:
            Navigator.of(context).pop(false);
            break;
          case RemoveCartOperation.yes:
            Navigator.of(context).pop(true);
            break;
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    double totalPrice = widget.quantity * widget.price;

    return Dismissible(
      key: ValueKey(widget.id),
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          contentPadding: const EdgeInsets.all(5),
          elevation: 3,
          titlePadding: const EdgeInsets.all(10),
          title: const Text(
            'Are you sure?',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Do you want to remove ${widget.name} from cart?',
            textAlign: TextAlign.center,
          ),
          actions: [
            textAction('Yes', RemoveCartOperation.yes),
            textAction('No', RemoveCartOperation.no),
            textAction('Cancel', RemoveCartOperation.no),
          ],
        ),
      ),
      onDismissed: (direction) => cartData.removeFromCart(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
          height: 115,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: const Icon(Icons.delete, color: Colors.white, size: 40),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 115,
          child: Card(
            color: Colors.grey[100],
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          ProductDetails.routeName,
                          arguments: {'id': widget.id},
                        ),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            ProductDetails.routeName,
                            arguments: {'id': widget.id},
                          ),
                          child: Text(
                            widget.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          widget.quantity > 1
                              ? 'Single: \$${widget.price.toString()}'
                              : '\$${widget.previousPrice.toString()}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            decoration: widget.quantity > 1
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 30,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => {
                                    widget.quantity > 1
                                        ? cartData.toggleQuantity(
                                            widget.id,
                                            'decrement',
                                          )
                                        : null
                                  },
                                  child: Text('-',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: widget.quantity == 1
                                            ? Colors.grey
                                            : Colors.deepOrange,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                                Text(
                                  widget.quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    cartData.toggleQuantity(
                                      widget.id,
                                      'increment',
                                    )
                                  },
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
