import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/components/badge.dart';
import 'package:shoppie/components/order_down_summary.dart';
import 'package:shoppie/components/single_order_item.dart';
import 'package:shoppie/providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Orders',
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
          Consumer<Orders>(
            builder: (_, orders, o) => Badge(
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.black,
              ),
              count: orders.orders.length.toString(),
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
      body: orderData.orders.isEmpty
          ? const Center(
              child: Text(
                'Opps! Your order list is empty',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          : Consumer<Orders>(
              builder: (_, orders, o) => Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      itemCount: orders.orders.length,
                      itemBuilder: (context, index) => SingleOrderItem(
                        id: orders.orders[index].id,
                        totalAmount: orders.orders[index].totalAmount,
                        date: orders.orders[index].orderDate,
                        orders: orders.orders[index]
                      ),
                    ),
                  ),
                  OrderDownSummary(orders.getTotal, orders.orders)
                ],
              ),
            ),
    );
  }
}
