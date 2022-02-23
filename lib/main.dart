// import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/cart.dart';
import 'package:shoppie/providers/product.dart';
import 'package:shoppie/screens/cart.dart';
import 'package:shoppie/screens/orders.dart';
import 'package:shoppie/screens/product_detail.dart';
import 'package:shoppie/screens/user_products.dart';
import 'components/navigation.dart';
import 'providers/orders.dart';
import 'screens/add_and_edit_product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders()),
      ],
      child: MaterialApp(
        routes: {
          ProductDetails.routeName: (context) => ProductDetails(),
          NavigationBar.routeName: (context) => const NavigationBar(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          UserProductScreen.routeName: (context) => const UserProductScreen(),
          AddAndEditProduct.routeName: (context) =>  AddAndEditProduct(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Colors.deepOrange,
          primarySwatch: Colors.deepOrange,
        ),
        home: const NavigationBar(),
      ),
    );
  }
}
