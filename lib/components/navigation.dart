import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/cart.dart';
import 'package:shoppie/screens/account.dart';
import 'package:shoppie/screens/body.dart';
import 'package:shoppie/screens/favorite.dart';
import 'package:shoppie/screens/cart.dart';
import 'badge.dart';
import 'drawer.dart';

enum FilterOps { favorite, all }

class NavigationBars extends StatefulWidget {
  const NavigationBars({Key? key}) : super(key: key);
  static const routeName = '/navigationBar';

  @override
  State<NavigationBars> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBars> {
  var showOnlyFavorites = false;

  // ignore: prefer_final_fields
  List<Widget> _page = [
    Body(),
    FavoriteScreen(),
    const CartScreen(),
    const AccountScreen()
  ];
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    },);
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
              label: 'Profile',
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
            PopupMenuButton(
              onSelected: (FilterOps selected) {
                if (selected == FilterOps.favorite) {
                  showOnlyFavorites = true;
                } else {
                  showOnlyFavorites = false;
                }
              },
              icon: const Icon(Icons.more_vert, color: Colors.black),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text('Only Favorities'),
                  value: FilterOps.favorite,
                ),
                const PopupMenuItem(
                  child: Text('All Products'),
                  value: FilterOps.all,
                ),
              ],
            ),

            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  count: cart.itemCount.toString(),
                  color: Colors.deepOrange),
            ),

    
          ],
          backgroundColor: Colors.white,
        ),
        body: _page[_selectedIndex]);
  }
}
