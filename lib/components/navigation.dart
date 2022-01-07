import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppie/models/data.dart';
import 'package:shoppie/screens/account.dart';
import 'package:shoppie/screens/body.dart';
import 'package:shoppie/screens/favorite.dart';
import 'package:shoppie/screens/cart.dart';
import 'drawer.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);
  static const routeName = '/navigationBar';

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // ignore: prefer_final_fields
  List<Widget> _page = const [
    Body(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen()
  ];
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String count = '';


    @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 1),
      (Timer t) => setState(
        () {
          count = cartItems.isEmpty ? '' : cartItems.length.toString();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Favorites',
            ),
          ],
        ),
        backgroundColor: Colors.white,
        drawer: const DrawerComponent(),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                CupertinoIcons.text_alignleft,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            const Icon(Icons.more_vert, color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  Text(
                   count,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
          // title: const Text('Shoppie'),
          backgroundColor: Colors.white,
        ),
        body: _page[_selectedIndex]);
  }
}
