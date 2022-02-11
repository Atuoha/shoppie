import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/models/product.dart';
import 'package:shoppie/providers/cart.dart';
import 'package:shoppie/providers/product.dart';

class SingleItemGridView extends StatefulWidget {
  final String name;
  final String id;
  final double price;
  final double previousPrice;
  final String imageUrl;
  final Product product;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SingleItemGridView({
    required this.name,
    required this.id,
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
    final productData = Provider.of<Products>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);

    // ignore: sized_box_for_whitespace
    return Container(
      height: 95,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
          ),
        ),
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
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
                            productData.isItemOnFavorite(widget.product)
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () => setState(
                            () {
                              productData.toggleItemtoFavirite(widget.product);
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            cartData.isItemOnCart(widget.id)
                                ? Icons.shopping_cart
                                : Icons.add_shopping_cart_sharp,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () => setState(
                            () {
                              cartData.addItemToCart(
                                widget.id,
                                widget.name,
                                widget.price,
                                widget.previousPrice,
                                widget.imageUrl,
                                // widget.imageUrl,
                              );
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
              padding: const EdgeInsets.all(4.0),
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
