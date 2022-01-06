import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemGridView extends StatelessWidget {
  final String name;
  final double price;
  final double previousPrice;
  final String imageUrl;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SingleItemGridView(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.previousPrice});

  @override
  Widget build(BuildContext context) {
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
                    imageUrl,
                     alignment: Alignment.center,
                    fit: BoxFit.cover,
                    height: 120,
                    cacheHeight:120,
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
                          icon: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {},
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
                    name,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${price.toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '\$${previousPrice.toString()}',
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
