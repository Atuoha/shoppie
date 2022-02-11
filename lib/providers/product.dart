import 'package:flutter/material.dart';
import 'package:shoppie/models/product.dart';

class Products with ChangeNotifier {
  // List<Product> cartItems = [];
  List<Product> favoriteItems = [];
  // List<double> totalPrice = [];

  // bool isItemOnCart(Product product) {
  //   return cartItems.any((cartitem) => cartitem.id == product.id);
  // }

  // void toggleItemtoCart(Product product) {
  //   if (isItemOnCart(product)) {
  //     for (var i = 0; i < totalPrice.length; i++) {
  //       if (totalPrice[i] == product.price) {
  //         totalPrice.removeWhere((price) => price == totalPrice[i]);
  //       }
  //     }
  //     cartItems.remove(product);
  //   } else {
  //     totalPrice.add(product.price);
  //     cartItems.add(product);
  //   }
  //   notifyListeners();
  // }


  void toggleItemtoFavirite(Product product) {
    if (isItemOnFavorite(product)) {
      favoriteItems.remove(product);
    } else {
      favoriteItems.add(product);
    }
    notifyListeners();
  }

  bool isItemOnFavorite(Product product) {
    return favoriteItems.any((favoriteItem) => favoriteItem.id == product.id);
  }

  // var _showOnlyFavorites = false;

  List<Product> get availableProducts {
    // if (_showOnlyFavorites) {
    //   return favItems;
    // }
    return [..._availableProducts];
  }

  // void showOnlyFavorites() {
  //   _showOnlyFavorites = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showOnlyFavorites = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return availableProducts.firstWhere((product) => product.id == id);
  }

  List<Product> get favItems {
    return _availableProducts.where((product) => product.isFavorite).toList();
  }

  final List<Product> _availableProducts = [
    Product(
      id: 'p7',
      name: 'Leather BackPack',
      imageUrl:
          'https://images.unsplash.com/photo-1571689936114-b16146c9570a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'The stronger the better it is to load it with all that the eyes sees useful and needful too. BackPack is a all-fit leather strong bag for carrying anything the hands can store and it\'s literally worth any penny',
      price: 30.9,
      previousPrice: 40.9,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p1',
      name: 'Smart Watch',
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
      description: 'A white smart watch with good features and more',
      price: 29.99,
      previousPrice: 39.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p16',
      name: 'PowerBook',
      imageUrl:
          'https://get.pxhere.com/photo/laptop-computer-macbook-mac-screen-water-board-keyboard-technology-air-mouse-photo-airport-aircraft-tablet-aviation-office-black-monitor-keys-graphic-hardware-image-pc-exhibition-multimedia-calculator-vector-water-cooling-floppy-disk-phased-out-desktop-computer-netbook-personal-computer-computer-monitor-electronic-device-computer-hardware-display-device-448748.jpg',
      description:
          'Awesome hardware, crappy keyboard and a hefty price. Buy now before a  one is released!',
      price: 2299.99,
      previousPrice: 3299.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p2',
      name: 'Red Sneakers',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'Perfect for your joggers and black T-shirts and more. The sneakers comes in different sizes and colors. You never know when that T-shirt needs some styles with the soft layers of a sneakers',
      price: 199.99,
      previousPrice: 299.99,
      colors: 'yellow,grey,black,red,teal',
    ),
    Product(
      id: 'p3',
      name: 'Nikon Camera',
      imageUrl:
          'https://images.unsplash.com/photo-1564466809058-bf4114d55352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'You can only see clearer with your eyes but a camera saves the memory in it\'s eyes',
      price: 89.9,
      previousPrice: 109.9,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p4',
      name: 'HeadSets',
      imageUrl:
          'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'The louder the sound, the better it feels inside with the body',
      price: 120.1,
      previousPrice: 150.1,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p5',
      name: 'Amazon SoundBox',
      imageUrl:
          'https://images.unsplash.com/photo-1543512214-318c7553f230?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'Automated soundbox with voice recognition and more. What could be more better',
      price: 78.19,
      previousPrice: 88.19,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p6',
      name: 'Xbox 360 GamePads',
      imageUrl:
          'https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'You never know when it is time to touch it better except the pads with xbox is there to assist',
      price: 98.99,
      previousPrice: 108.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p8',
      name: 'Stand with a Cam',
      imageUrl:
          'https://images.unsplash.com/photo-1612548403247-aa2873e9422d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'Even the universe could be snapped with a touch of this awesome camera. The more clearer, the better',
      price: 99.99,
      previousPrice: 109.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p9',
      name: 'Game Boy',
      imageUrl:
          'https://images.unsplash.com/photo-1531525645387-7f14be1bdbbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODF8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description: 'A game for keys between the ages of 4-9',
      price: 9.99,
      previousPrice: 19.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p10',
      name: 'Keyboard',
      imageUrl:
          'https://images.unsplash.com/photo-1625948515291-69613efd103f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTJ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
      description:
          'Type your way out of stress and low income. Allow the keys save the day',
      price: 76.99,
      previousPrice: 86.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p11',
      name: 'Beats by Dre',
      imageUrl:
          'https://images.unsplash.com/photo-1545127398-5aae47194b22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTEzfHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      description:
          'Beats by Dr Dre is a sound headset you do not want to miss out without laying your hands on it',
      price: 67.99,
      previousPrice: 77.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p12',
      name: 'iSets',
      imageUrl:
          'https://images.unsplash.com/photo-1522273500616-6b4757e4c184?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE5fHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      description:
          'Comes along with an Iphone, Watch, Ipod and more. It is better than buying all',
      price: 2399.99,
      previousPrice: 3499.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p13',
      name: 'camLens',
      imageUrl:
          'https://images.unsplash.com/photo-1609900179119-3ed9f4530eb8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcwfHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      description:
          'With lens on you could see better, with camLens a camera can see more better',
      price: 77.99,
      previousPrice: 87.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p14',
      name: 'Coffee Mug',
      imageUrl:
          'https://images.pexels.com/photos/160834/coffee-cup-and-saucer-black-coffee-loose-coffee-beans-160834.jpeg?cs=srgb&dl=bean-beans-black-coffee-160834.jpg&fm=jpg',
      description: 'Can also be used for tea!',
      price: 8.99,
      previousPrice: 10.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p15',
      name: 'The Book - Limited Edition',
      imageUrl:
          'https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg?cs=srgb&dl=blur-blurred-book-pages-46274.jpg&fm=jpg',
      description:
          "What the content is? Why would that matter? It's a limited edition!",
      price: 15.99,
      previousPrice: 25.99,
      colors: 'red,grey,black,indigo,purple',
    ),
    Product(
      id: 'p17',
      name: 'Pen & Paper',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/10/03/02/14/pen-969298_1280.jpg',
      description:
          "Can be used for role-playing (not the kind of role-playing you're thinking about...).",
      price: 5.49,
      previousPrice: 15.49,
      colors: 'red,grey,black,indigo,purple',
    )
  ];
}
