// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shoppie/models/data.dart';

enum factor { increment, decrement }

class SingleCartItem extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final double previousPrice;
  // final double totalPrice;
  // ignore: use_key_in_widget_constructors
  SingleCartItem(this.name, this.image, this.price, this.previousPrice);

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int quantity = 1;

  void alterQuantity(factor fact) {
    switch (fact) {
      case factor.increment:
        setState(
          () {
            quantity += 1;
            totalPrice.add(widget.price);
          },
        );
        break;
      case factor.decrement:
        setState(
          () {
            if (quantity > 1) {
              quantity -= 1;
              totalPrice.remove(widget.price);
            }
          },
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * widget.price;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 115,
        child: Card(
          color: Colors.grey[100],
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '\$${widget.previousPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 30,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => alterQuantity(factor.decrement),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: quantity == 1
                                        ? Colors.grey
                                        : Colors.deepOrange,
                                  ),
                                ),
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => alterQuantity(factor.increment),
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 20,
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
    );
  }
}
