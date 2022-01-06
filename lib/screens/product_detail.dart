import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppie/models/data.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var id = data["id"] as String;
    var productDetails = Products.firstWhere((product) {
      return product.id == id;
    });

    Widget buildContainer(Color color) {
      return Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart,
                color: Colors.deepOrange,
              ),
            )
          ]),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.zero,
                bottom: Radius.circular(100),
              ),
              child: Image.network(
                productDetails.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    productDetails.name,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.deepOrange, size: 15),
                      Icon(Icons.star, color: Colors.deepOrange, size: 15),
                      Icon(Icons.star, color: Colors.deepOrange, size: 15),
                      Icon(Icons.star, color: Colors.deepOrange, size: 15),
                      Icon(Icons.star, color: Colors.deepOrange, size: 15),
                      SizedBox(width: 20),
                      Text('(3400 Reviews)')
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$${productDetails.price.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '\$${productDetails.previousPrice.toString()}',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Available in stocks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Out of stocks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Colors Available',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainer(Colors.black),
                        buildContainer(Colors.grey),
                        buildContainer(Colors.pink),
                        buildContainer(Colors.green),
                        buildContainer(Colors.purple),
                        buildContainer(Colors.teal)
                      ]),
                  const SizedBox(height: 15),
                  const Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productDetails.description,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add to cart'),
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
          ),
        ],
      ),
    );
  }
}
