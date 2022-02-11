import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/models/product.dart';
import 'package:shoppie/providers/cart.dart';
import 'package:shoppie/providers/product.dart';

// ignore: use_key_in_widget_constructors
class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    final productData = Provider.of<Products>(context);

    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var id = data["id"] as String;

    Product productDetails = productData.findById(id);

    List<String> availableColors = productDetails.colors.split(',');
    late Color colored;

    Color getColor(String color) {
      switch (color) {
        case 'red':
          colored = Colors.red;
          break;
        case 'purple':
          colored = Colors.purple;
          break;
        case 'grey':
          colored = Colors.grey;
          break;
        case 'black':
          colored = Colors.black;
          break;
        case 'orange':
          colored = Colors.orange;
          break;
        case 'indigo':
          colored = Colors.indigo;
          break;
        case 'yellow':
          colored = Colors.yellow;
          break;
        case 'blue':
          colored = Colors.blue;
          break;
        case 'brown':
          colored = Colors.brown;
          break;
        case 'teal':
          colored = Colors.teal;
          break;
        default:
      }

      return colored;
    }

    showImageModal(context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(productDetails.imageUrl),
                  ),
                ),
                Positioned(
                  right: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(productDetails.name),
                          const SizedBox(width: 5),
                          Text(
                            '\$${productDetails.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      );
    }

    Widget buildContainer(color) {
      return Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
          color: getColor(color),
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
              icon: Icon(
                productData.isItemOnFavorite(productDetails)
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: Colors.deepOrange,
              ),
              onPressed: () => setState(
                () {
                  productData
                      .toggleItemtoFavirite(productDetails);
                },
              ),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => showImageModal(context),
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
                          decoration: TextDecoration.lineThrough,
                        ),
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
                      for (var color in availableColors) buildContainer(color)
                    ],
                  ),
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
                    onPressed: () => setState(
                      () {
                         cartData.addItemToCart(
                                productDetails.id,
                                productDetails.name,
                                productDetails.price,
                                productDetails.previousPrice,
                                productDetails.imageUrl,
                              );
                      },
                    ),
                    child: Text(cartData
                            .isItemOnCart(productDetails.id)
                        ? 'Remove from Cart'
                        : 'Add to Cart'),
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
