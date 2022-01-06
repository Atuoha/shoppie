import 'package:flutter/material.dart';
import 'package:shoppie/components/single_item_grid.dart';
import 'package:shoppie/models/data.dart';
import 'package:shoppie/screens/product_detail.dart';

class GridItemView extends StatelessWidget {
  const GridItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: Products.map((product) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: {'id': product.id},
          ),
          child: SingleItemGridView(
            name: product.name,
            price: product.price,
            previousPrice: product.previousPrice,
            imageUrl: product.imageUrl,
          ),
        );
      }).toList(),
    );
  }
}
