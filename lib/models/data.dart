import './product.dart';

List<Product> cartItems = [];
List<Product> favoriteItems = [];

List<double> totalPrice = [];
// double getCartTotalPrice() {
//   for (int i = 0; i < cartItems.length; i++) {
//     totalPrice += cartItems[i].price;
//   }
//   return totalPrice;
// }

bool isItemOnCart(Product product) {
  return cartItems.any((cartitem) => cartitem.id == product.id);
}

bool isItemOnFavorite(Product product) {
  return favoriteItems.any((favoriteItem) => favoriteItem.id == product.id);
}

void toggleItemtoCart(Product product) {
  if (isItemOnCart(product)) {
    for (var i = 0; i < totalPrice.length; i++) {
      if (totalPrice[i] == product.price) {
        totalPrice.remove(product.price);
      }
    }
    cartItems.remove(product);
    print(totalPrice);
  } else {
    totalPrice.add(product.price);
    cartItems.add(product);
    print(totalPrice);
  }
}

void toggleItemtoFavirite(Product product) {
  if (isItemOnFavorite(product)) {
    favoriteItems.remove(product);
  } else {
    favoriteItems.add(product);
  }
}

// ignore: constant_identifier_names
const Products = [
  Product(
    'p7',
    ['ui'],
    'Leather BackPack',
    'https://images.unsplash.com/photo-1571689936114-b16146c9570a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'The stronger the better it is to load it with all that the eyes sees useful and needful too. BackPack is a all-fit leather strong bag for carrying anything the hands can store and it\'s literally worth any penny',
    30.9,
    40.9,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p1',
    ['u1'],
    'Smart Watch',
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    'A white smart watch with good features and more',
    29.99,
    39.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p16',
    ['u3'],
    'PowerBook',
    'https://get.pxhere.com/photo/laptop-computer-macbook-mac-screen-water-board-keyboard-technology-air-mouse-photo-airport-aircraft-tablet-aviation-office-black-monitor-keys-graphic-hardware-image-pc-exhibition-multimedia-calculator-vector-water-cooling-floppy-disk-phased-out-desktop-computer-netbook-personal-computer-computer-monitor-electronic-device-computer-hardware-display-device-448748.jpg',
    'Awesome hardware, crappy keyboard and a hefty price. Buy now before a  one is released!',
    2299.99,
    3299.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p2',
    ['u1'],
    'Red Sneakers',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'Perfect for your joggers and black T-shirts and more. The sneakers comes in different sizes and colors. You never know when that T-shirt needs some styles with the soft layers of a sneakers',
    199.99,
    299.99,
    'yellow,grey,black,red,teal',
  ),
  Product(
    'p3',
    ['u1'],
    'Nikon Camera',
    'https://images.unsplash.com/photo-1564466809058-bf4114d55352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'You can only see clearer with your eyes but a camera saves the memory in it\'s eyes',
    89.9,
    109.9,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p4',
    ['u1'],
    'HeadSets',
    'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'The louder the sound, the better it feels inside with the body',
    120.1,
    150.1,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p5',
    ['u1'],
    'Amazon SoundBox',
    'https://images.unsplash.com/photo-1543512214-318c7553f230?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'Automated soundbox with voice recognition and more. What could be more better',
    78.19,
    88.19,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p6',
    ['u1'],
    'Xbox 360 GamePads',
    'https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'You never know when it is time to touch it better except the pads with xbox is there to assist',
    98.99,
    108.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p8',
    ['ui'],
    'Stand with a Cam',
    'https://images.unsplash.com/photo-1612548403247-aa2873e9422d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'Even the universe could be snapped with a touch of this awesome camera. The more clearer, the better',
    99.99,
    109.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p9',
    ['ui'],
    'Game Boy',
    'https://images.unsplash.com/photo-1531525645387-7f14be1bdbbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODF8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'A game for keys between the ages of 4-9',
    9.99,
    19.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p10',
    ['ui'],
    'Keyboard',
    'https://images.unsplash.com/photo-1625948515291-69613efd103f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTJ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'Type your way out of stress and low income. Allow the keys save the day',
    76.99,
    86.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p11',
    ['ui'],
    'Beats by Dre',
    'https://images.unsplash.com/photo-1545127398-5aae47194b22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTEzfHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'Beats by Dr Dre is a sound headset you do not want to miss out without laying your hands on it',
    67.99,
    77.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p12',
    ['ui'],
    'iSets',
    'https://images.unsplash.com/photo-1522273500616-6b4757e4c184?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE5fHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'Comes along with an Iphone, Watch, Ipod and more. It is better than buying all',
    2399.99,
    3499.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p13',
    ['ui'],
    'camLens',
    'https://images.unsplash.com/photo-1609900179119-3ed9f4530eb8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcwfHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'With lens on you could see better, with camLens a camera can see more better',
    77.99,
    87.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p14',
    ['u2'],
    'Coffee Mug',
    'https://images.pexels.com/photos/160834/coffee-cup-and-saucer-black-coffee-loose-coffee-beans-160834.jpeg?cs=srgb&dl=bean-beans-black-coffee-160834.jpg&fm=jpg',
    'Can also be used for tea!',
    8.99,
    10.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p15',
    ['ui'],
    'The Book - Limited Edition',
    'https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg?cs=srgb&dl=blur-blurred-book-pages-46274.jpg&fm=jpg',
    "What the content is? Why would that matter? It's a limited edition!",
    15.99,
    25.99,
    'red,grey,black,indigo,purple',
  ),
  Product(
    'p17',
    ['ui'],
    'Pen & Paper',
    'https://cdn.pixabay.com/photo/2015/10/03/02/14/pen-969298_1280.jpg',
    "Can be used for role-playing (not the kind of role-playing you're thinking about...).",
    5.49,
    15.49,
    'red,grey,black,indigo,purple',
  )
];
