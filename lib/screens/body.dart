import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/components/grid_item_view.dart';
import 'package:shoppie/components/carousel_item.dart';
import 'package:shoppie/providers/product.dart';

// ignore: use_key_in_widget_constructors
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _initState = true;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initState) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context, listen: false).fetchProduct().then(
            (_) => {
              setState(() {
                _isLoading = false;
              })
            },
          );
    }
    super.didChangeDependencies();
    _initState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      CarouselItem(
                        'BLACK FRIDAY OFFERS 😎',
                        'assets/imgs/jumia3.jpg',
                        Colors.black,
                      ),
                      CarouselItem(
                        'BLACK FRIDAY 45% OFF',
                        'assets/imgs/jumia2.jpg',
                        Colors.pinkAccent,
                      ),
                      CarouselItem(
                        'WOW SALE DISCOUNT -15%',
                        'assets/imgs/2.jpeg',
                        Colors.green,
                      ),
                      CarouselItem(
                        '50% OFF DURING COVID 19',
                        'assets/imgs/1.jpeg',
                        Colors.red,
                      ),
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
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  )
                : Consumer<Products>(
                    builder: (_, products, p2) => GridItemView(
                      Provider.of<Products>(
                        context,
                        listen: false,
                      ).availableProducts,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
