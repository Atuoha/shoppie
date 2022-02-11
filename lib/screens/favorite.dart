import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/components/grid_item_view.dart';
import 'package:shoppie/providers/product.dart';

// ignore: use_key_in_widget_constructors
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<Products>(context).favoriteItems.isEmpty
        ? const Center(
            child: Text('Opps! No Item is your favorite'),
          )
        : Padding(
            padding: const EdgeInsets.all(10),
            child: GridItemView(
              Provider.of<Products>(context, listen: false).favoriteItems,
            ),
          );
  }
}
