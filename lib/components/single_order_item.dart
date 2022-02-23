// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/orders.dart';
import 'package:intl/intl.dart';

enum RemoveCartOperation { yes, no }

class SingleOrderItem extends StatefulWidget {
  final String id;
  final double totalAmount;
  final DateTime date;
  final OrderItem orders;

  // ignore: use_key_in_widget_constructors
  SingleOrderItem(
      {required this.id,
      required this.totalAmount,
      required this.date,
      required this.orders});

  @override
  State<SingleOrderItem> createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends State<SingleOrderItem> {
  var _isExpanded = false;

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

  @override
  Widget build(BuildContext context) {
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
            'Do you want to remove items with \$${widget.totalAmount} from order?',
            textAlign: TextAlign.center,
          ),
          actions: [
            textAction('Yes', RemoveCartOperation.yes),
            textAction('No', RemoveCartOperation.no),
            textAction('Cancel', RemoveCartOperation.no),
          ],
        ),
      ),
      key: ValueKey(widget.id),
      onDismissed: (direction) =>
          Provider.of<Orders>(context, listen: false).removeOrder(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20)),
              subtitle: Text(
                DateFormat(' dd MMM yyy hh:mma').format(widget.date),
              ),
              leading: const Icon(Icons.shopping_bag),
              trailing: IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () => setState(() {
                  _isExpanded = !_isExpanded;
                }),
              ),
            ),
            if (_isExpanded)
              // ignore: sized_box_for_whitespace
              Container(
                height: min(
                  widget.orders.products.length * 20.0 + 100,
                  180,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 3,
                  ),
                  child: ListView.builder(
                    itemCount: widget.orders.products.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        backgroundImage: NetworkImage(
                          widget.orders.products[index].imageUrl,
                        ),
                      ),
                      title: Text(
                        widget.orders.products[index].name,
                      ),
                      subtitle: Text(
                        'Quantity: ${widget.orders.products[index].quantity}',
                      ),
                      trailing: Text(
                        '\$${widget.orders.products[index].price}',
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
