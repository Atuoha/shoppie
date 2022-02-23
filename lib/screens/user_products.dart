import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/components/single_user_grid_item.dart';
import 'package:shoppie/providers/product.dart';
import 'package:shoppie/screens/product_detail.dart';

import 'add_and_edit_product.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Your Products',
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.deepOrange,
            size: 25,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () =>    
              Navigator.of(context).pushNamed(
                AddAndEditProduct.routeName,
              ),
            ),
          ),
        ],
      ),
      body: productData.availableProducts.isEmpty
          ? const Center(
              child: Text(
                'Opps! Your product list is empty',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: Consumer<Products>(
                builder: (_, product, p) => ListView.builder(
                  itemCount: productData.availableProducts.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          ProductDetails.routeName,
                          arguments: {
                            'id': product.availableProducts[index].id,
                          },
                        ),
                        child: SingleUserProductItem(
                          id: product.availableProducts[index].id,
                          name: product.availableProducts[index].name,
                          imageUrl: product.availableProducts[index].imageUrl,
                          price: product.availableProducts[index].price,
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
