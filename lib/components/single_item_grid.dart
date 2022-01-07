import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppie/models/data.dart';
import 'package:shoppie/models/product.dart';

class SingleItemGridView extends StatefulWidget {
  final String name;
  final double price;
  final double previousPrice;
  final String imageUrl;
  final Product product;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SingleItemGridView({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.previousPrice,
    required this.product,
  });

  @override
  State<SingleItemGridView> createState() => _SingleItemGridViewState();
}

class _SingleItemGridViewState extends State<SingleItemGridView> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 90,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    height: 120,
                    cacheHeight: 120,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            isItemOnFavorite(widget.product)
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () => setState(
                            () {
                              toggleItemtoFavirite(widget.product);
                            },
                          ),
                        ),
                        IconButton(
                          icon:  Icon(
                             isItemOnCart(widget.product)
                                ? Icons.shopping_cart
                                : Icons.shopping_cart_outlined,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () => setState(
                            () {
                              toggleItemtoCart(widget.product);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price.toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '\$${widget.previousPrice.toString()}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
