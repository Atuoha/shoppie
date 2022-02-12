// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/orders.dart';
import 'package:intl/intl.dart';

enum Operation { increment, decrement }

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

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
              subtitle:
                  Text(DateFormat(' dd MMM yyy hh:mma').format(widget.date)),
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
              Container(
                height: min(
                  widget.orders.products.length * 20.0 + 100,
                  180,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: widget.orders.products.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.shopping_basket_rounded),
                      title: Text(
                        widget.orders.products[index].name,
                      ),
                      trailing:
                          Text('\$${widget.orders.products[index].price}'),
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
