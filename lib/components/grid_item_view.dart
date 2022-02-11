// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shoppie/components/single_item_grid.dart';
import 'package:shoppie/models/product.dart';
import 'package:shoppie/screens/product_detail.dart';

class GridItemView extends StatefulWidget {
  List<Product> products;
  // ignore: use_key_in_widget_constructors
  GridItemView(this.products);

  @override
  State<GridItemView> createState() => _GridItemViewState();
}

class _GridItemViewState extends State<GridItemView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: widget.products.map(
        (product) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              ProductDetails.routeName,
              arguments: {'id': product.id},
            ).then(
              (value) => {
                setState(() {
                  widget.products = widget.products;
                })
              },
            ),
              child: SingleItemGridView(
                name: product.name,
                id: product.id,
                price: product.price,
                previousPrice: product.previousPrice,
                imageUrl: product.imageUrl,
                product: product,
              ),
          );
        },
      ).toList(),
    );
  }
}
