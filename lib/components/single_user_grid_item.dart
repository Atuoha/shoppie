import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/product.dart';
import 'package:shoppie/screens/add_and_edit_product.dart';

enum RemoveCartOperation { yes, no }

class SingleUserProductItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SingleUserProductItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget textAction(String text, RemoveCartOperation operation) {
      return TextButton(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        onPressed: () {
          switch (operation) {
            case RemoveCartOperation.no:
              Navigator.of(context).pop(false);
              break;
            case RemoveCartOperation.yes:
              Navigator.of(context).pop(true);
              break;
            default:
          }
        },
      );
    }

    SnackBar customSnackBar(String text, Color color) {
      return SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
      );
    }

    return Dismissible(
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.all(5),
          elevation: 3,
          titlePadding: const EdgeInsets.all(10),
          title: const Text(
            'Are you sure?',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Do you want to remove $name from order?',
            textAlign: TextAlign.center,
          ),
          actions: [
            textAction('Yes', RemoveCartOperation.yes),
            textAction('No', RemoveCartOperation.no),
            textAction('Cancel', RemoveCartOperation.no),
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(name),
      onDismissed: (direction) =>
          {Provider.of<Products>(context, listen: false).deleteProduct(id)},
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(
          '\$${price.toStringAsFixed(2)}',
        ),
        // ignore: sized_box_for_whitespace
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AddAndEditProduct.routeName,
                    arguments: id,
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you Sure?'),
                    content: Text('Are you sure you want to delete $name?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          try {
                            await Provider.of<Products>(context, listen: false)
                                .deleteProduct(id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(
                                '$name has been deleted!',
                                Colors.green.withOpacity(0.8),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(
                                'An error has occured!',
                                Colors.deepOrange.withOpacity(0.8),
                              ),
                            );
                          } finally {
                            Navigator.of(context).pop(true);
                          }
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrange,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
