import 'package:flutter/material.dart';
import 'package:shoppie/screens/orders.dart';
import 'package:shoppie/screens/user_products.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildMenuTile(String title, IconData icon, String routeName) {
      return ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
      );
    }

    return Drawer(
      child: Column(children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRect(
                    child: Image.asset(
                      'assets/imgs/b6.jpg',
                      height: 210,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 90,
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/imgs/default.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: const [
                            Text(
                              'Tony Atuoha',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'Product Manager',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    buildMenuTile('Manage Products', Icons.add, UserProductScreen.routeName),
                    buildMenuTile('Ordered Products', Icons.shopping_bag, OrdersScreen.routeName),
                    buildMenuTile('Reports', Icons.insert_chart_rounded, ''),
                    buildMenuTile('Statistics', Icons.show_chart, ''),
                    buildMenuTile('Sign Out', Icons.logout_outlined, ''),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const Divider(),
              buildMenuTile('Tell a Friend', Icons.share, ''),
              buildMenuTile('Help and Feedback', Icons.help, ''),
            ],),
          ),
        )
      ],),
    );
  }
}
