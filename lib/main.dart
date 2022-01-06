import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppie/screens/product_detail.dart';

import 'components/grid_item_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topPromoCard(String text, String image, Color colors) {
      return Container(
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: double.infinity,
        child: Card(
          color: Colors.transparent,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        maxLines: 3,
                        // ignore: deprecated_member_use
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Get Now',
                          style: TextStyle(
                            color: colors,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        image,
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      routes: {
        ProductDetails.routeName: (context)=> ProductDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.deepOrange,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle:
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
        drawer: Drawer(
          child: Container(
            child: const Text('ddddd'),
          ),
        ),
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
          actions: const [
            Icon(Icons.more_vert, color: Colors.black),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
          // title: const Text('Shoppie'),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          'Welcome to Shoppie🛒',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Let\'s get something awesome and lovely?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CarouselSlider(
                        items: [
                          topPromoCard(
                            '50% OFF DURING COVID 19',
                            'assets/imgs/1.jpeg',
                            Colors.red,
                          ),
                          topPromoCard(
                            'BLACK FRIDAY 45% OFF',
                            'assets/imgs/jumia2.jpg',
                            Colors.pinkAccent,
                          ),
                          topPromoCard(
                            'WOW SALE DISCOUNT -15%',
                            'assets/imgs/2.jpeg',
                            Colors.green,
                          ),
                          topPromoCard(
                            'BLACK FRIDAY OFFERS 😎',
                            'assets/imgs/jumia3.jpg',
                            Colors.black,
                          )
                        ],
                        options: CarouselOptions(
                          reverse: true,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.7,
                          aspectRatio: 2.0,
                          initialPage: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'This week\'s latest 😍😋',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Shop for the most amazing items 2022 needs!',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(child: GridItemView())
            ],
          ),
        ),
      ),
    );
  }
}
